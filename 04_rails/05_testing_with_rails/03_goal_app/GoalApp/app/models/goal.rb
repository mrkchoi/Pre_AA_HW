# == Schema Information
#
# Table name: goals
#
#  id           :bigint(8)        not null, primary key
#  user_id      :integer          not null
#  goal_content :text             not null
#  goal_type    :string           default("public"), not null
#  completed    :string           default("false"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Goal < ApplicationRecord
  validates :user_id, :goal_content, presence: true

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :comments,
    as: :commentable
  )
end
