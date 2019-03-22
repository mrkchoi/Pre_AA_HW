require_relative './questions.rb'
require_relative './model_base.rb'

require_relative './users.rb'
require_relative './question.rb'
########################################
# QUESTION LIKE
########################################
class QuestionLike < ModelBase
  attr_accessor :id, :user_id, :question_id

  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        u.id, u.fname, u.lname
      FROM
        users AS u
      JOIN
        question_likes ON question_likes.user_id = u.id
      WHERE
        question_likes.question_id = ?
    SQL
    likers.map {|datum| User.new(datum)}
  end

  def self.num_likes_for_question_id(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(user_id)
      FROM
        question_likes
      WHERE
        question_likes.question_id = ?
      GROUP BY
        question_id
    SQL
    likes.first.values[0]
  end

  def self.liked_questions_for_user_id(user_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_likes
      JOIN
        questions ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL
    likes.map {|datum| Question.new(datum)}
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        q.*
      FROM
        question_likes
      JOIN
        questions AS q ON q.id = question_likes.question_id
      GROUP BY
        q.id
      ORDER BY
        COUNT(question_likes.question_id) DESC
      LIMIT 
        ?
    SQL
    questions.map {|datum| Question.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end
