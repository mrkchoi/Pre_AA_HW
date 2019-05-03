class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {'_'}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    return [] if !@secret_word.include?(char)
    matches = []
    @secret_word.each_char.with_index do |el, i|
      if char == el
        matches << i
      end
    end
    matches
  end
  
  def fill_indices(char, arr)
    arr.each do |idx|
      @guess_word[idx] = char
    end
  end   

  def try_guess(char)
    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      if get_matching_indices(char).empty?
        @remaining_incorrect_guesses -= 1
      else
        matches = get_matching_indices(char)
        fill_indices(char, matches)
      end
    end
    return true
  end

  def ask_user_for_guess
    p 'Enter a char:'
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    else
      return false
    end
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
