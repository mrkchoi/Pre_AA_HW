require 'active_support/inflector'
require_relative './questions.rb'
require 'byebug'


class ModelBase
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
    db = CLASS_TO_DB[self.class.to_s]
    inst_vars = self.instance_variables
    debugger
    inst_vars.delete(:@id)

    values_hash = Hash.new
    inst_vars.each do |var|
      accessor = var.to_s[1..-1]
      values_hash[var] = self.send(accessor)
    end

    if @id.nil?
      q_str = (['?'] * inst_vars.count).join(', ')
      set_str = inst_vars.join(', ')
      set_str.tr!('@', '')
      
      
      entry = QuestionsDatabase.instance.execute(<<-SQL, *values_hash.values)
        INSERT INTO
          #{db} (#{set_str})
        VALUES
          (#{q_str})
      SQL

      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      set_str = "#{inst_vars.join(' = ?, ')} = ?"
      set_str.tr!('@', '')

      QuestionsDatabase.instance.execute(<<-SQL, *values_hash.values, @id)
        UPDATE
          #{db}
        SET
          #{set_str}
        WHERE
          id = ?
      SQL
    end
  end

  def self.where(options)
    # take options hash and deconstruct, placing keys/values as WHERE conditions
    # reference self to pick the correct query location

    db = CLASS_TO_DB[self.to_s]
    key = ''
    val = ''
    options.each do |k, v|
      key << k.to_s
      val << v      
    end

    query = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{db}
      WHERE
        #{key} = "#{val}"
    SQL

    query.map {|datum| self.new(datum)}
  end
end