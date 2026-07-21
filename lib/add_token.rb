
class AddToken
  attr_reader :board, :pl_token, :index, :board_rows

  def initialize(board, pl_token, index)
    @board = board
    @pl_token = pl_token
    @index = index - 1
    @board_rows = @board.length
  end

  def drop_token
    #I don't quite know the syntax, but I think I know what I want
    #to do. Here is my order of operations.
    #board row depth. Find out how many rows the board has.
    #write code that goes to the last row and check if that spot
    #is empty. Once it finds an empty spot right to that spot and 
    #end the method.
    #The index will be used to determine with column to write
    #pl_token will be the symbol to use.

    #for (i = #board_row_length; i >= 0; i--)
    #  if board[i][index] == '-' then return board[i][index] = pl_token end
    #  if board[i][index] != '-' then next end
    #I think I could also do this
    #  if board[i][index] != '-' then next end
    #  return board[i][index] = pl_token
    #I am still fuzzy on Ruby for loops. I need to now figure out how to
    #do this reverse for loop in Ruby.
    
    (0..@board_rows).reverse_each do |i|
      next if board[i][index] != "-"
      break board[i][index] = pl_token
    end

  end
end