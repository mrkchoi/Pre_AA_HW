require 'sqlite3'
require 'singleton'
require 'active_support/inflector'

# require_relative './model_base.rb'
# require_relative './users.rb'
# require_relative './question.rb'
# require_relative './question_follow.rb'
# require_relative './reply.rb'
# require_relative './question_like.rb'


########################################
# INITIAL DB <-> RUBY INSTANCE
########################################
class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

