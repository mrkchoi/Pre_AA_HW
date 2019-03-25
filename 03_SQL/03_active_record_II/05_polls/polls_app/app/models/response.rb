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
  validate :not_answering_own_poll

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

  # AUTHOR CANNOT RESPOND TO OWN POLL

  def author_answering_own_poll?
    question.poll.author_id == self.user_id

    # poll_author_id = Poll.joins(questions: {answer_choices: :responses}).select('polls.author_id').distinct.where(self.answer_choice_id: poll: {question: :answer_choices}).pluck(:author_id)
  end

  def not_answering_own_poll
    if author_answering_own_poll?
      errors[:user_id] << 'cannot answer question from poll they created!'
    end
  end

end
