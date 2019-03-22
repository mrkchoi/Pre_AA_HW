require 'active_support/inflector'
require_relative './questions.rb'
require 'byebug'


class ModelBase
  # debugger
  CLASS_TO_DB = {
    'Question' => 'questions',
    'User' => 'users',
    'QuestionFollow' => 'question_follows',
    'Reply' => 'replies',
    'QuestionLike' => 'question_likes'
  }
  
  def self.find_by_id(id)
    db = CLASS_TO_DB[self.to_s]

    object = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{db}
      WHERE
        id = ?
    SQL

    self.new(object.first)
  end

  def self.all
    db = CLASS_TO_DB[self.to_s]

    object = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{db}
    SQL
    object.map {|datum| self.new(datum)}
  end

  def save
    
  end

  

end