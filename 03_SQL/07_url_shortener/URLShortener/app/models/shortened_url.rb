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

  def num_clicks
    self.visits.count
  end

  def num_uniques
    visitors.count
  end
  
  def num_recent_uniques
    visits.select(:user_id).distinct.where('created_at > ?', 10.minutes.ago).count
  end  
end
