require 'byebug'
require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params) # => :name => "Haskell", :color => "calico"
    where_line = params.map {|param_name, value| "#{param_name} = ?"}.join(" AND ")

    print where_line
      
    # debugger
    results = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line}
    SQL

    parse_all(results)
  end
end

class SQLObject
  extend Searchable
  
end
