# == Schema Information
#
# Table name: houses
#
#  id         :bigint(8)        not null, primary key
#  house_type :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#



class House < ActiveRecord::Base
  has_many :cats,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Cat'

  has_many :toys,
    through: :cats,
    source: :toys

    # def toys
    #   toys = []
    #   self.cats.each do |cat|
    #     toys += cat.toys
    #   end
    #   toys
    # end
end
