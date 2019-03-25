# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint(8)        not null, primary key
#  question_id :integer          not null
#  text        :text             not null
#

class AnswerChoice < ApplicationRecord
  validates :question_id, presence: true
  validates :text, presence: true

  belongs_to(
    :question,
      class_name: 'Question',
      foreign_key: :question_id,
      primary_key: :id
  )

  has_many(
    :responses,
      class_name: 'Response',
      foreign_key: :answer_choice_id,
      primary_key: :id
  )
end
