class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index {|el, i| indices << i if char == el}
    indices
  end

  def fill_indices(char, indices_arr)
    indices_arr.each {|index| @guess_word[index] = char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      @remaining_incorrect_guesses -= 1 if self.get_matching_indices(char).empty?
      self.fill_indices(char, get_matching_indices(char))
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char: "
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p "WIN"
      return true
    end
      return false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    return false
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      return false
    end
  end

end


