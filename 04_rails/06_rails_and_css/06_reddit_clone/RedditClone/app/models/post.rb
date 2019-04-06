# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :author_id, presence: true

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :post_subs,
    class_name: 'PostSub',
    foreign_key: :post_id,
    primary_key: :id,
    dependent: :destroy,
    inverse_of: :post
  )

  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )

end
