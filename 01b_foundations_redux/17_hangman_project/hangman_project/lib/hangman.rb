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
end
