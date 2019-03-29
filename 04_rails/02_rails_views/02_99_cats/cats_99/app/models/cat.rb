

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = ['orange', 'brown', 'black', 'white', 'yellow', 'grey']
  SEXES = ['M', 'F']

  validates :color, inclusion: { in: COLORS, message: "not a valid color" }
  validates :sex, inclusion: {in: SEXES, message: "sex must be M or F only"}
  validates :birth_date, :name, :sex, :description, presence: true

  def age
    birth_date = self.birth_date
    date_now = Time.now

    distance_of_time_in_words(birth_date, date_now)
  end
end