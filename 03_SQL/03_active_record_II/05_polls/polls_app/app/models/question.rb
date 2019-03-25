# == Schema Information
#
# Table name: questions
#
#  id      :bigint(8)        not null, primary key
#  poll_id :integer          not null
#  text    :text             not null
#
require 'byebug'

class Question < ApplicationRecord
  validates :poll_id, presence: true
  validates :text, presence: true

  has_many(
    :answer_choices,
      class_name: 'AnswerChoice',
      foreign_key: :question_id,
      primary_key: :id
  )

  belongs_to(
    :poll,
      class_name: 'Poll',
      foreign_key: :poll_id,
      primary_key: :id
  )

  has_many(
    :responses,
      through: :answer_choices,
      source: :responses
  )

  def results

    # results = Hash.new(0)
    # answer_choices.each do |answer_choice|
    #   results[answer_choice.text] += 1
    # end
    # results

    # results = Hash.new(0)
    # choices = answer_choices.includes(:responses)
    # choices.each do |choice|
    #   results[choice.text] += 1
    # end

    # results

    Question.joins(:responses).select('answer_choices.text, COUNT(responses)').group('answer_choices.text').where('questions.id = ?', self.id).as_json
  end
end
