require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_instance)
        p "Exact matches: #{@secret_code.num_exact_matches(code_instance)}"
        p "Near matches: #{@secret_code.num_near_matches(code_instance)}"
    end

    def ask_user_for_guess
        p "Enter a code"
        code_instance = Code.from_string(gets.chomp)
        self.print_matches(code_instance)
        @secret_code == code_instance
    end
end

