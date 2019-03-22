require_relative './questions.rb'
require_relative './model_base.rb'

require_relative './users.rb'
require_relative './question.rb'
########################################
# REPLY
########################################
class Reply < ModelBase
  attr_accessor :id, :body, :question_id, :parent_reply_id, :user_id

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    data.map {|data| Reply.new(data)}
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    data.map {|data| Reply.new(data)}
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @user_id = options['user_id']
  end

  def author
    raise "#{self} not in database" unless @id
    User.find_by_id(@user_id)
  end

  def question
    raise "#{self} not in database" unless @id
    Question.find_by_id(@question_id)
  end

  def parent_reply
    raise "#{self} not in database" unless @id
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    children = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL
    children.map {|data| Reply.new(data)}
  end

  def save
    QuestionsDatabase.instance.execute(<<-SQL, self.body, self.question_id, self.parent_reply_id, self.user_id)
      INSERT INTO
        replies (body, question_id, parent_reply_id, user_id)
      VALUES
        (?, ?, ?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end
end