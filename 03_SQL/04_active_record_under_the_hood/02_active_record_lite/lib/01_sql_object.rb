require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns
      @columns
    else
      @columns ||= DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
      SQL
      @columns = @columns.first
      @columns.map(&:to_sym)
    end
  end

  def self.finalize!
    columns.each do |col_name|
      define_method(col_name) do
        attributes[col_name]
      end
      define_method("#{col_name}=") do |val|
        attributes[col_name] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL

    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = ?
    SQL
    self.parse_all(result).first
  end

  def initialize(params = {})      
    # debugger
    params.each do |attr_name, val|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name.to_s)
        self.send("#{attr_name}=", val)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    attr_vals = self.class.columns.map do |attr_name|
      self.send("#{attr_name}")
    end
    attr_vals
  end

  def insert
    col_names = self.class.columns.join(', ')
    question_marks = (['?'] * self.class.columns.count).join(', ')

    DBConnection.execute(<<-SQL, self.attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    attr_vals = attribute_values
    col_names = self.class.columns[1..-1]
    combined_set = col_names.map {|col| "#{col} = ?"}.join(', ')

    DBConnection.execute(<<-SQL, *attribute_values.rotate(1))
      UPDATE
        #{self.class.table_name}
      SET
        #{combined_set}
      WHERE
        id = ?
    SQL
  end

  def save
    self.id.nil? ? insert : update
  end
end
