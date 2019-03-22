require_relative './questions.rb'
require_relative './model_base.rb'

require_relative './users.rb'
require_relative './question.rb'
########################################
# QUESTION FOLLOW
########################################
class QuestionFollow < ModelBase
  attr_accessor :id, :user_id, :question_id

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        questions ON questions.associated_author_id = users.id
      WHERE
        questions.id = ?
    SQL
    data.map {|datum| User.new(datum)}
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        users ON users.id = questions.associated_author_id
      WHERE
        questions.associated_author_id = ?
    SQL
    data.map {|datum| Question.new(datum)}
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        questions
      JOIN
        users ON users.id = questions.associated_author_id
      GROUP BY
        questions.associated_author_id
      ORDER BY
        COUNT(associated_author_id)
      LIMIT ?
    SQL
    data.map {|datum| Question.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end