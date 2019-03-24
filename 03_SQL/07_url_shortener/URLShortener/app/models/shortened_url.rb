require 'securerandom'

# == Schema Information
#
# Table name: shortened_urls
#
#  id                   :bigint(8)        not null, primary key
#  long_url             :string
#  short_url            :string
#  submitted_by_user_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class ShortenedURL < ApplicationRecord
  validates :submitted_by_user_id, presence: true
  validates :short_url, uniqueness: true
  validate :no_spamming, :nonpremium_max

  belongs_to(
    :submitter,
      class_name: 'User',
      foreign_key: :submitted_by_user_id,
      primary_key: :id
  )

  has_many(
    :visits,
      class_name: 'Visit',
      foreign_key: :visited_url_id,
      primary_key: :id
  )

  has_many(
    :visitors,
      Proc.new { distinct },
      through: :visits,
      source: :user
  )

  has_many(
    :taggings,
      class_name: 'Tagging',
      foreign_key: :url_id,
      primary_key: :id
  )

  has_many(
    :tag_topics,
      through: :taggings,
      source: :topics
  )

  def self.random_code
    unique_url = SecureRandom.urlsafe_base64(16)

    until !self.exists?(:short_url => unique_url)
      unique_url = SecureRandom.urlsafe_base64(16)
    end

    unique_url    
  end

  def self.create_shortened_url_from_user_and_long_url(user, url_long)
      ShortenedURL.create!({
        long_url: url_long,
        short_url: self.random_code,
        submitted_by_user_id: user.id
      })
  end

  def self.prune(mins)
    urls_within_timeframe = ShortenedURL.where('created_at > ?', mins.minutes.ago).destroy_all
    # urls_within_timeframe.joins(:visits).where('visits.count(visited_url_id) = 0' )
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    visitors.count
  end
  
  def num_recent_uniques
    visits.select(:user_id).distinct.where('created_at > ?', 10.minutes.ago).count
  end  

  def no_spamming
    # Filter rows by user_id, check if count > 5 && diff between first & last is less than 1 minute, then return false

    url_count = ShortenedURL.all.where(submitted_by_user_id: self.submitted_by_user_id).count
    latest_url = 
    ShortenedURL.select(:created_at).where(submitted_by_user_id: self.submitted_by_user_id).limit(5).first
    fifth_latest_url = 
    ShortenedURL.select(:created_at).where(submitted_by_user_id: self.submitted_by_user_id).limit(5).last

    if url_count >= 5 && (fifth_latest_url.created_at - latest_url.created_at) < 1
      errors[:base] << "can't submit more than 5 URLS per minute."
    end
  end

  def nonpremium_max
    if ShortenedURL.all.where(submitted_by_user_id: self.submitted_by_user_id).count >= 5
      errors[:base] << 'non-premium members are limited to 5 urls!'
    end
  end
end
