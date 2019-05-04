require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code_inst)
    exact_matches = @secret_code.num_exact_matches(code_inst)
    near_matches = @secret_code.num_near_matches(code_inst)
    p exact_matches
    p near_matches
  end

  def ask_user_for_guess
    p 'Enter a code'
    input = gets.chomp
    code_guess = Code.from_string(input)
    self.print_matches(code_guess)
    @secret_code == code_guess
  end
end
