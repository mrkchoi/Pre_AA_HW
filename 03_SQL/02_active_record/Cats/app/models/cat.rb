# == Schema Information
#
# Table name: cats
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  color      :string
#  house_id   :integer
#



class Cat < ActiveRecord::Base
  validates :name, presence: true
  validates :color, presence: true
  validate :no_green_cats

  def no_green_cats
    if self.color == 'green'
      self.errors[:color] << "can't be green"
    end
  end

  def self.how_long_to_find_sarahs_in_ms
    start = Time.now
    Cat.where(name: 'Sarah').to_a
    (Time.now - start) * 1000
  end

  belongs_to :house, {
      primary_key: :id, 
      foreign_key: :house_id,
      class_name: 'House'
  }

  has_many :toys,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'Toy'
end
