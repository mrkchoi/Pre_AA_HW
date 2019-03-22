require_relative './questions.rb'
require_relative './model_base.rb'

require_relative './users.rb'
require_relative './question.rb'
require_relative './reply.rb'
require_relative './question_follow.rb'

########################################
# USER
########################################
class User < ModelBase
  attr_accessor :id, :fname, :lname

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND
        lname = ?
    SQL
    data.map {|data| User.new(data)}
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    raise "#{self} not in database" unless @id
    Question.find_by_author_id(@id)
  end

  def authored_replies
    raise "#{self} not in database" unless @id
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    raise "#{self} not in database" unless @id
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    # Join users & questions & question_likes 
    # Get the count of distinct questions
    # Get the total count of likes
    # divide likes / questions AS average_likes
    avg_karma = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        CAST(COUNT(ql.user_id) AS FLOAT) / COUNT(DISTINCT(q.id))
      FROM
        questions AS q
      LEFT OUTER JOIN
        question_likes AS ql ON q.id = ql.question_id
      WHERE
        q.associated_author_id = ?
    SQL
    avg_karma.first.values[0]
  end

  def save
    QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

end