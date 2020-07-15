class Code

  attr_reader :pegs


  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }


  def self.random(num)
    secret_code = Array.new(num) { POSSIBLE_PEGS.keys.sample }
    Code.new(secret_code)

  end


  def self.from_string(user_guess)
    submission = []
    user_guess.each_char {|char| submission << char }
    Code.new(submission)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    correct = 0
    guess.pegs.each_with_index do |peg, index|
      if guess[index] == @pegs[index]
        correct+=1
      end
    end
    correct
  end

  def num_near_matches(guess)
    near = 0
    i=0
    while i < @pegs.length
      if @pegs.include?(guess[i]) && guess[i] != @pegs[i] 
        near += 1
        
      end
      i+=1
    end
    return near 
  end


  def ==(guess)
    self.pegs == guess.pegs
  end

  def self.valid_pegs?(pegs)
    if pegs.all?{|peg| POSSIBLE_PEGS.has_key?(peg.upcase)}
      return true
    else
      return false
    end
  end

  def initialize(pegs)
     if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
     else 
      raise "That's not a valid move"
     end

    
  end


end
