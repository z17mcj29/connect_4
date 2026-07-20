

class CreateBoard
  attr_reader :row, :column, :win_size

  def initialize(row = 6, column = 7)
    @row = row
    @column = column
    @win_size = win_size
  end

  def new_board
    Array.new(@column) {Array.new(@row, '-')}
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