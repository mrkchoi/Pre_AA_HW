# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#

class Response < ApplicationRecord
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :not_duplicate_response

  belongs_to(
    :answer_choice,
      class_name: 'AnswerChoice',
      foreign_key: :answer_choice_id,
      primary_key: :id
  )

  belongs_to(
    :respondent,
      class_name: 'User',
      foreign_key: :user_id,
      primary_key: :id
  )

  has_one(
    :question,
      through: :answer_choice,
      source: :question
  )
  
  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << 'cannot answer the same question more than once!'
    end
  end
end
