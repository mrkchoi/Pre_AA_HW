# == Schema Information
#
# Table name: tag_topics
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagTopic < ApplicationRecord
  # create validations
  validates :name, presence: true, uniqueness: true
  # create associations
  has_many(
    :taggings,
      class_name: 'Tagging',
      foreign_key: :topic_id,
      primary_key: :id
  )

  has_many(
    :tagged_links,
      through: :taggings,
      source: :tagged_urls
  )

  def popular_links
    tagged_links.select(:long_url).limit(5)

    # find all possible links
    # find count of num visits to each link
    # order by count desc

    # <<-SQL
    #   SELECT
        
    #   WHERE
        
    # SQL
    
    
  end
end
