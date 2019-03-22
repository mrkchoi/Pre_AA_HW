require_relative './questions.rb'
require_relative './model_base.rb'

require_relative './users.rb'
require_relative './reply.rb'
require_relative './question_follow.rb'
require_relative './question_like.rb'
########################################
# QUESTION
########################################
class Question < ModelBase
  attr_accessor :id, :title, :body, :associated_author_id

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        associated_author = ?
    SQL
    data.map {|data| Question.new(data)}
  end

  def self.most_followed(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows ON question_follows.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(question_follows.question_id) DESC
      LIMIT
        ?
    SQL
    data.map {|datum| Question.new(datum)}
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @associated_author_id = options['associated_author_id']
  end

  def author
    raise "#{self} not in database" unless @id
    User.find_by_id(@associated_author_id)
  end
  
  def replies
    raise "#{self} not in database" unless @id
    Reply.find_by_question_id(@id)
  end

  def followers
    raise "#{self} not in database" unless @id
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  def save
    QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.associated_author_id)
      INSERT INTO
        questions (title, body, associated_author_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end
end
