

class CreateBoard
  # attr_reader :row, :column

  # def initialize(row = 6, column = 7)
  #   @row = row
  #   @column = column
    
  # end

  # def new_board
  #   Array.new(@row) {Array.new(@column, '-')}
  # end

  def self.new_board(row, column)
    Array.new(row) {Array.new(column, '-')}
  end
  #to use this I go
  #new_board = CreateBoard.new_board(6,7)

end


# test_board = Array.new(6) {Array.new(7, '-')}

# p test_board[0]
# p test_board[0].length
# p test_board.length
# p test_board[0][0].length

# test_board.each do |item|
#   p item
# end