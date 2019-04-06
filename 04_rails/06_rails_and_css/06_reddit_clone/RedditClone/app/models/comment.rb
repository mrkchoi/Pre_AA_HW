# == Schema Information
#
# Table name: comments
#
#  id        :bigint(8)        not null, primary key
#  content   :text             not null
#  author_id :integer          not null
#  post_id   :integer          not null
#

class Comment < ApplicationRecord
  validates :content, :author_id, :post_id, presence: true

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )

  belongs_to(
    :post,
    class_name: 'Post',
    foreign_key: :post_id,
    primary_key: :id
  )
  
end
