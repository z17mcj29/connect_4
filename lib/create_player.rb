

class CreatePlayer
  attr_reader :token, :column_width
  def initialize(token, column_width)
    @token = token    
    @column_width = column_width
  end

  def player_input
    #get input
    input = gets.chomp
    #validate input is between 1 and column_width
    return input if input.match(/^\d+$[1-@column_width]/) && (input >= 1 && input <= column_width)
    #Repeat until valid choice is selected
    #Return valid selection
  end

end