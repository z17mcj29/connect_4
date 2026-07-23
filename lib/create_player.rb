

class CreatePlayer
  attr_reader :token, :column_width
  def initialize(token, column_width)
    @token = token    
    @column_width = column_width
  end

  def player_input
    loop do
    #get input
    input = gets.chomp
    num = input.to_i
    #validate input is between 1 and column_width
    if input.match(/^\d+$/) && (num >= 1 && num <= @column_width)
      return num
    end    
  end
  end

  def random_input
    rand(1..@column_width)
  end

end