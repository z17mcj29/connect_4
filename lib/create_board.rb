

class CreateBoard
  attr_reader :row, :column

  def initialize(row = 6, column = 7)
    @row = row
    @column = column
    
  end

  def new_board
    Array.new(@row) {Array.new(@column, '-')}
  end

end


# test_board = Array.new(6) {Array.new(7, '-')}

# p test_board[0]
# p test_board[0].length
# p test_board.length
# p test_board[0][0].length

# test_board.each do |item|
#   p item
# end