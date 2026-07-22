

class PrintBoard
  # attr_reader :board

  # def initialize(board)
  #   @board = board
  # end

  #print_board. I am thinking of using flatten and then
  #putting a \n at the end of the row length. I also want
  #to have the board also add some walls automatically. I
  #want to make this programatically instead of making
  #the board by hand.
  def self.print_board(board_array)
    flattened_board = board_array.flatten
    row_length = board_array[0].length #not sure this is correct, will have to research more
    current_index = 0
    flattened_board.each do |el|
      print "|#{el}"
      current_index += 1
      print "|\n" if current_index % row_length == 0
    end

  end

end