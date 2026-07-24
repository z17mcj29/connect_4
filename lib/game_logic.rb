

class GameLogic
  def self.game_tie(board)
    if board[0].include?('-') then
      return false
    else
      return true
    end
  end

  def self.game_win(board, index, win_length = 4)
    #locate exact location of most recent token
    #I want to do something like this
    #board[0][col_index] check if == token
    #board[1][col_index] check if == token
    #until I find the first instance of token
    #Each time i iterate to the next row I will
    #incremet row_index by 1. This shoudld give me
    #the row and column of the token.
    row_index = 0
    board_rows = board.length - 1
    col_index = index.to_i
    (0..board_rows).each do |i|
      next if board[i][col_index] == '-'
      row_index = i
      break
    end
    #perform win logic on that token spot
    (0...win_length).each do |i|
      #bounds checks
      #Both these nil checks might need the .dig method
      #I realize this initial approach breaks my idea to have a
      #flexible win condition size. I am going to get it working
      #with 4 token win condition and then figure out
      #how to refactor.
      next if board.dig(row_index,col_index - i + (win_length - 1)) == nil
      #next if board.dig(row_index, col_index - i) < 0
      next if board.dig(row_index, col_index - i) == "-"
      return true if [board[row_index][col_index - i],
                      board[row_index][col_index - i + 1],
                      board[row_index][col_index - i + 2],
                      board[row_index][col_index - i + 3]].all? { |el| el == board[row_index][col_index - i] }
    end
    (0...win_length).each do |i|
      #angle check
      #bounds check
      next if board.dig(row_index - i + (win_length - 1),col_index - i + (win_length - 1)) == nil
      #next if board.dig(row_index - i, col_index - i) < 0
      next if board.dig(row_index - i, col_index - i) == "-"
      return true if [board[row_index - i][col_index - i],
                     board[row_index - i + 1][col_index - i + 1],
                     board[row_index - i + 2][col_index - i + 2],
                     board[row_index - i + 3][col_index - i + 3]].all? { |el| el == board[row_index - i][col_index - i] }
    end
  end
end