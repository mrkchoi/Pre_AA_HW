# == Schema Information
#
# Table name: subs
#
#  id           :bigint(8)        not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, :moderator_id, presence: true

  belongs_to(
    :moderator,
    class_name: 'User',
    foreign_key: :moderator_id,
    primary_key: :id
  )

  has_many(
    :post_subs,
    class_name: 'PostSub',
    foreign_key: :sub_id,
    primary_key: :id,
    dependent: :destroy,
    inverse_of: :sub
  )

  has_many(
    :posts,
    through: :post_subs,
    source: :post
  )

end
