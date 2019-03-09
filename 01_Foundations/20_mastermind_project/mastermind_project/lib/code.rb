class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def self.random(len)
    random_pegs = []
    random_pegs << POSSIBLE_PEGS.keys.sample until random_pegs.length == len
    Code.new(random_pegs)
  end

  def self.from_string(pegs_str)
    Code.new(pegs_str.split(''))
  end

  def initialize(chars)
    @pegs = []
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "Invalid pegs found!"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_instance)
    matches = 0
    @pegs.each_with_index {|el, i| matches += 1 if @pegs[i] == code_instance[i]}
    matches
  end

  def num_near_matches(code_instance)
    all_matches = 0
    code_instance.pegs.each_with_index {|el, i| all_matches += 1 if @pegs.include?(el)}
    all_matches - num_exact_matches(code_instance)
  end

  # ['R', 'G', 'R', 'B'] => Original
  # ['B', 'R', 'Y', 'Y'] => 2
  # ['R', 'G', 'R', 'B'] => 0

  def ==(code_instance)
    @pegs == code_instance.pegs
  end
end
