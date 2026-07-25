

class GameLogic
  def self.game_tie(board)
    if board[0].include?('-') then
      return false
    else
      return true
    end
  end

  def self.game_win_doesnt_word(board, index, win_length = 4)
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
    board_columns = board[0].length - 1
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
      next if col_index - i < 0 || col_index - i + (win_length - 1) > board_columns
      #next if board.dig(row_index,col_index - i + (win_length - 1)) == nil
      #next if board.dig(row_index, col_index - i) < 0
      #next if board.dig(row_index, col_index - i) == "-"
      return true if [board[row_index][col_index - i],
                      board[row_index][col_index - i + 1],
                      board[row_index][col_index - i + 2],
                      board[row_index][col_index - i + 3]].all? { |el| el == board[row_index][col_index - i] }
    end
    (0...win_length).each do |i|
      #angle check
      #bounds check
      next if row_index - i < 0 || col_index - i < 0 || row_index - i + (win_length - 1) > board_rows || col_index - i + (win_length - 1) > board_columns
      #next if board.dig(row_index - i + (win_length - 1),col_index - i + (win_length - 1)) == nil
      #next if board.dig(row_index - i, col_index - i) < 0
      #next if board.dig(row_index - i, col_index - i) == "-"
      return true if [board[row_index - i][col_index - i],
                     board[row_index - i + 1][col_index - i + 1],
                     board[row_index - i + 2][col_index - i + 2],
                     board[row_index - i + 3][col_index - i + 3]].all? { |el| el == board[row_index - i][col_index - i] }
    end
  end

  def self.game_win(board, index, win_length = 4)
    #attempt # 2 at game win. Couldn't figure out the logic with last attempt
    #I"m going to take a slightly different approach this time
    
    #region Determine the column and row token dropped in. Also sets variable for board width and column width
    
      row_index = 0
      board_rows = board.length - 1
      board_columns = board[0].length - 1
      col_index = index.to_i
      (0..board_rows).each do |i|
        next if board[i][col_index] == '-'
        row_index = i
        break
      end
    #endregion
    return false if board[row_index][col_index] == '-'
    #region Horizontal Check
    case col_index
    when 0
      
      if [board[row_index][col_index], #[X,x,x,x,-,-,-]
         board[row_index][col_index + 1],
         board[row_index][col_index + 2],
         board[row_index][col_index + 3]].all? { |el| el == board[row_index][col_index] }
         return true        
      end
      when 1
      if [board[row_index][col_index], #[-,X,x,x,x,-,-]
         board[row_index][col_index + 1],
         board[row_index][col_index + 2],
         board[row_index][col_index + 3]].all? { |el| el == board[row_index][col_index] } ||
         [board[row_index][col_index - 1], #[x,X,x,x,-,-,-]
         board[row_index][col_index],
         board[row_index][col_index + 1],
         board[row_index][col_index + 2]].all? { |el| el == board[row_index][col_index] }
         return true      
      end
      when 2
      if [board[row_index][col_index], #[-,-,X,x,x,x,-]
         board[row_index][col_index + 1],
         board[row_index][col_index + 2],
         board[row_index][col_index + 3]].all? { |el| el == board[row_index][col_index] } ||
         [board[row_index][col_index - 2], #[x,x,X,x,-,-,-]
         board[row_index][col_index - 1],
         board[row_index][col_index ],
         board[row_index][col_index + 1]].all? { |el| el == board[row_index][col_index] } ||
         [board[row_index][col_index - 1], #[-,x,X,x,x,-,-]
         board[row_index][col_index],
         board[row_index][col_index + 1],
         board[row_index][col_index + 2]].all? { |el| el == board[row_index][col_index] }         
         return true      
      end
      when 3
      if [board[row_index][col_index], #[-,-,,X,x,x,x]
         board[row_index][col_index + 1],
         board[row_index][col_index + 2],
         board[row_index][col_index + 3]].all? { |el| el == board[row_index][col_index] } ||
         [board[row_index][col_index - 3], #[x,x,x,X,-,-,-]
         board[row_index][col_index - 2],
         board[row_index][col_index - 1 ],
         board[row_index][col_index]].all? { |el| el == board[row_index][col_index] } ||
         [board[row_index][col_index - 2], #[-,x,x,X,x,-,-]
         board[row_index][col_index - 1],
         board[row_index][col_index],
         board[row_index][col_index + 1]].all? { |el| el == board[row_index][col_index] } ||
         [board[row_index][col_index - 1], #[-,-,x,X,x,x,-]
         board[row_index][col_index],
         board[row_index][col_index + 1],
         board[row_index][col_index + 2]].all? { |el| el == board[row_index][col_index] }          
         return true      
      end
      when 4
      if [board[row_index][col_index - 1], #[-,-,-,x,X,x,x]
         board[row_index][col_index],
         board[row_index][col_index + 1],
         board[row_index][col_index + 2]].all? { |el| el == board[row_index][col_index] } ||
         [board[row_index][col_index - 2], #[-,-,x,x,X,x,-]
         board[row_index][col_index - 1],
         board[row_index][col_index],
         board[row_index][col_index + 1]].all? { |el| el == board[row_index][col_index] } ||
         [board[row_index][col_index - 3], #[-,x,x,x,X,-,-]
         board[row_index][col_index - 2],
         board[row_index][col_index - 1],
         board[row_index][col_index]].all? { |el| el == board[row_index][col_index] }
         return true
      end
      when 5
      if [board[row_index][col_index - 2], #[-,-,-,x,x,X,x]
         board[row_index][col_index - 1],
         board[row_index][col_index],
         board[row_index][col_index + 1]].all? { |el| el == board[row_index][col_index] } ||
         [board[row_index][col_index - 3], #[-,-,x,x,x,X,-]
         board[row_index][col_index - 2],
         board[row_index][col_index - 1],
         board[row_index][col_index]].all? { |el| el == board[row_index][col_index] }
         return true
      end
      when 6
      if [board[row_index][col_index - 3], #[-,-,-,x,x,x,X]
         board[row_index][col_index - 2],
         board[row_index][col_index - 1],
         board[row_index][col_index]].all? { |el| el == board[row_index][col_index] }
         return true
      end
      #endregion

    end

    (0...win_length - 1).each do |i|
      #If I write out the row logic like column logic, that will be alot of code. I need to think
      #through how the for loop works and get this logic to work.
      
      #board[row_index, col_index]: If this is board[0][0] then I would check for two conditions
      #and the rest would be negated. 4 diagonal right and 4 straight down.
      #If either row_index or col_index become negative, I need to skip that check iteration because in
      #Ruby if a number becomes negative it loops from the back of the array.
      #One bug I noticed from my previous attempt is I need to redue win_length size by 1. 
      #Win_Length 4. 0...4 exclusive is 0, 1, 2,3, so 0...4 - 1 is 0, 1, 2. The 4th spot
      #is taken by the initial token placement. So I have been checking a bit too far.
      next if row_index - i < 0 || col_index - i < 0
      #In my board[0][0] the only iteration that should work is the first one where both col and row are 0. Any
      #further iterations should result in 'next'
      #I am also going to check to make sure my base value isn't '-'. I did this before, but I think
      #its throwing an error. I believe my mistake is integer to string conversion so I need to make
      #a variable holding the string and then check that variable.
      test_token = board[row_index][col_index]
      next if test_token == '-'
      #The next check is if I"m reaching the bottom right of the board and checking the next four
      #squares will go beyond the bounds of my board. I think I had this logic right before.
      next if row_index + win_length - 1 > board_rows || col_index + win_length - 1 > board_columns

      return true if [board[row_index - i][col_index - i],
                     board[row_index - i + 1][col_index - i + 1],
                     board[row_index - i + 2][col_index - i + 2],
                     board[row_index - i + 3][col_index - i + 3]].all? { |el| el == board[row_index][col_index] }
      end
      #My final check will be straight down.
      (0...win_length - 1).each do |i|
        #[-,-,x,x,x,x] if the row index is above 2 it will go beyond the board. Need to guard against that.
        next if row_index >= 3        
        return true if [board[row_index][col_index], 
                        board[row_index + 1][col_index],
                        board[row_index + 2][col_index],
                        board[row_index + 3][col_index]].all? { |el| el == board[row_index][col_index] }
      end
      false
  end 
end

