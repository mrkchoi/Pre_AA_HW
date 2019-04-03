# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  content          :string           not null
#  commentable_type :string
#  commentable_id   :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  author_id        :integer          not null
#

class Comment < ApplicationRecord
  validates :content, :commentable_type, :commentable_id, :author_id, presence: true

  belongs_to :commentable, polymorphic: true
  
  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )
end
