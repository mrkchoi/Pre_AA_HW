# == Schema Information
#
# Table name: people
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  house_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Person < ApplicationRecord
  validates :name, presence: true

  belongs_to(
    :house,
      class_name: 'House',
      foreign_key: :house_id,
      primary_key: :id
  )
end
