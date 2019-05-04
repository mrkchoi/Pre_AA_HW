class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    if arr.all? {|el| POSSIBLE_PEGS.include?(el.upcase)}
      return true
    else
      return false
    end
  end

  def self.random(length)
    pegs = []
    length.times {pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(pegs)
  end

  def self.from_string(string)
    pegs = string.chars
    Code.new(pegs)
  end

  attr_reader :pegs

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise 'not a valid set of pegs'
    end
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_inst)
    count = 0

    code_inst.pegs.each_with_index do |peg, i|
      count += 1 if @pegs[i] == peg
    end

    count
  end

  def num_near_matches(code_inst)
    pegs = @pegs
    new_pegs = code_inst.pegs
    reduced = false

    until reduced
      reduced = true
      pegs.each_with_index do |peg, i|
        if pegs[i] == new_pegs[i]
          pegs.delete_at(i)
          new_pegs.delete_at(i)
          reduced = false
        end
      end
    end

    near_matches = []

    pegs.each do |peg|
      near_matches << peg if new_pegs.include?(peg) && !near_matches.include?(peg)
    end

    near_matches.count
  end

  def ==(code_inst)
    code_inst.pegs == self.pegs
  end
  
end
