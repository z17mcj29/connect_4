

class GameLogic
  def self.game_tie(board)
    if board[0].include?('-') then
      return false
    else
      return true
    end
  end

  def self.game_win_doesnt_work(board, index, win_length = 4)
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

  def self.game_win_doesnt_work_2(board, index, win_length = 4)
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
                     board[row_index - i + 3][col_index - i + 3]].all? { |el| el == board[row_index][col_index] } ||
                     [board[row_index - i][col_index - i],
                     board[row_index - i - 1][col_index - i + 1],
                     board[row_index - i - 2][col_index - i + 2],
                     board[row_index - i - 3][col_index - i + 3]].all? { |el| el == board[row_index][col_index] }
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

  def self.find_token_coordinates(board, index)
    board_rows = board.length - 1
    col_index = index.to_i
    row_index = 0

    (0..board_rows).each do |i|
      next if board[i][col_index] == '-'
      row_index = i
      break
    end
    { row: row_index, col: col_index }
  end

  def self.prove_line(board, coords, vector, win_length = 4)
    token = board[coords[:row]][coords[:col]]
    board_width = board[0].length - 1
    board_height = board.length - 1
    (1...win_length).each do |i|
      current_token = board[coords[:row] + (i * vector[:row])][coords[:col] + (i * vector[:col])]
      next if token != current_token
      row_top_check = coords[:row] - vector[:row] * i
      row_bottom_check = coords[:row] + vector[:row] * i
      col_left_check = coords[:col] - vector[:col] * i
      col_right_check = coords[:col] + vector[:col] * i
      next if row_top_check < 0 || col_left_check < 0
      next if row_bottom_check > board_height || col_right_check > board_width
      return true
    end
    return false
  end

  def self.game_win_doesnt_work_3(board, index, win_length = 4)
    coordinates = find_token_coordinates(board, index)
  end

  def self.game_win(b)
    #I've been on this problem for four days now and haven't solved it. I want to finish this
    #project and move on to the next lesson so I am going to do the board manually. I know
    #that I have computer science coming up so I might come back and revisit this and work
    #to get it working with a variable board and variable win condition. I think I can solve this
    #problem but I have been thinking about it intently and working on it and haven't solved it
    #yet. I think if I finish this and move on I will be able to continue to think about it and
    #then come back and do it how I want later. Right now I'm going to make this manual board solve
    #and move on.
    
    #region Horizontal Checks
      return true if [b[0][0], b[0][1], b[0][2], b[0][3]].all? { |el| el == b[0][0] && el != '-'}
      return true if [b[0][1], b[0][2], b[0][3], b[0][4]].all? { |el| el == b[0][1] && el != '-'}
      return true if [b[0][2], b[0][3], b[0][4], b[0][5]].all? { |el| el == b[0][2] && el != '-'}
      return true if [b[0][3], b[0][4], b[0][5], b[0][6]].all? { |el| el == b[0][3] && el != '-'}

      return true if [b[1][0], b[1][1], b[1][2], b[1][3]].all? { |el| el == b[1][0] && el != '-'}
      return true if [b[1][1], b[1][2], b[1][3], b[1][4]].all? { |el| el == b[1][1] && el != '-'}
      return true if [b[1][2], b[1][3], b[1][4], b[1][5]].all? { |el| el == b[1][2] && el != '-'}
      return true if [b[1][3], b[1][4], b[1][5], b[1][6]].all? { |el| el == b[1][3] && el != '-'}

      return true if [b[2][0], b[2][1], b[2][2], b[2][3]].all? { |el| el == b[2][0] && el != '-'}
      return true if [b[2][1], b[2][2], b[2][3], b[2][4]].all? { |el| el == b[2][1] && el != '-'}
      return true if [b[2][2], b[2][3], b[2][4], b[2][5]].all? { |el| el == b[2][2] && el != '-'}
      return true if [b[2][3], b[2][4], b[2][5], b[2][6]].all? { |el| el == b[2][3] && el != '-'}

      return true if [b[3][0], b[3][1], b[3][2], b[3][3]].all? { |el| el == b[3][0] && el != '-'}
      return true if [b[3][1], b[3][2], b[3][3], b[3][4]].all? { |el| el == b[3][1] && el != '-'}
      return true if [b[3][2], b[3][3], b[3][4], b[3][5]].all? { |el| el == b[3][2] && el != '-'}
      return true if [b[3][3], b[3][4], b[3][5], b[3][6]].all? { |el| el == b[3][3] && el != '-'}

      return true if [b[4][0], b[4][1], b[4][2], b[4][3]].all? { |el| el == b[4][0] && el != '-'}
      return true if [b[4][1], b[4][2], b[4][3], b[4][4]].all? { |el| el == b[4][1] && el != '-'}
      return true if [b[4][2], b[4][3], b[4][4], b[4][5]].all? { |el| el == b[4][2] && el != '-'}
      return true if [b[4][3], b[4][4], b[4][5], b[4][6]].all? { |el| el == b[4][3] && el != '-'}

      return true if [b[5][0], b[5][1], b[5][2], b[5][3]].all? { |el| el == b[5][0] && el != '-'}
      return true if [b[5][1], b[5][2], b[5][3], b[5][4]].all? { |el| el == b[5][1] && el != '-'}
      return true if [b[5][2], b[5][3], b[5][4], b[5][5]].all? { |el| el == b[5][2] && el != '-'}
      return true if [b[5][3], b[5][4], b[5][5], b[5][6]].all? { |el| el == b[5][3] && el != '-'}
    #endregion

    #region Down Checks

      return true if [b[0][0], b[1][0], b[2][0], b[3][0]].all? { |el| el == b[0][0] && el != '-'}
      return true if [b[1][0], b[2][0], b[3][0], b[4][0]].all? { |el| el == b[1][0] && el != '-'}
      return true if [b[2][0], b[3][0], b[4][0], b[5][0]].all? { |el| el == b[2][0] && el != '-'}
      
      return true if [b[0][1], b[1][1], b[2][1], b[3][1]].all? { |el| el == b[0][1] && el != '-'}
      return true if [b[1][1], b[2][1], b[3][1], b[4][1]].all? { |el| el == b[1][1] && el != '-'}
      return true if [b[2][1], b[3][1], b[4][1], b[5][1]].all? { |el| el == b[2][1] && el != '-'}

      return true if [b[0][2], b[1][2], b[2][2], b[3][2]].all? { |el| el == b[0][2] && el != '-'}
      return true if [b[1][2], b[2][2], b[3][2], b[4][2]].all? { |el| el == b[1][2] && el != '-'}
      return true if [b[2][2], b[3][2], b[4][2], b[5][2]].all? { |el| el == b[2][2] && el != '-'}

      return true if [b[0][3], b[1][3], b[2][3], b[3][3]].all? { |el| el == b[0][3] && el != '-'}
      return true if [b[1][3], b[2][3], b[3][3], b[4][3]].all? { |el| el == b[1][3] && el != '-'}
      return true if [b[2][3], b[3][3], b[4][3], b[5][3]].all? { |el| el == b[2][3] && el != '-'}

      return true if [b[0][4], b[1][4], b[2][4], b[3][4]].all? { |el| el == b[0][4] && el != '-'}
      return true if [b[1][4], b[2][4], b[3][4], b[4][4]].all? { |el| el == b[1][4] && el != '-'}
      return true if [b[2][4], b[3][4], b[4][4], b[5][4]].all? { |el| el == b[2][4] && el != '-'}

      return true if [b[0][5], b[1][5], b[2][5], b[3][5]].all? { |el| el == b[0][5] && el != '-'}
      return true if [b[1][5], b[2][5], b[3][5], b[4][5]].all? { |el| el == b[1][5] && el != '-'}
      return true if [b[2][5], b[3][5], b[4][5], b[5][5]].all? { |el| el == b[2][5] && el != '-'}

      return true if [b[0][6], b[1][6], b[2][6], b[3][6]].all? { |el| el == b[0][6] && el != '-'}
      return true if [b[1][6], b[2][6], b[3][6], b[4][6]].all? { |el| el == b[1][6] && el != '-'}
      return true if [b[2][6], b[3][6], b[4][6], b[5][6]].all? { |el| el == b[2][6] && el != '-'}
    
    #endregion
    
    #region Diagonal Checks
    #   0   1    2    3    4    5    6
    #[['-','-', '-', 'A', 'B', 'C', 'D'], 0
    # ['-','-', 'A', 'B', 'C', 'D', 'E'], 1
    # ['-','A', 'B', 'C', 'D', 'E', 'F'], 2
    # ['A','B', 'C', 'D', 'E', 'F', '-'], 3
    # ['B','C', 'D', 'E', 'F', '-', '-'], 4
    # ['C','D', 'E', 'F', '-', '-', '-']] 5
      return true if [b[0][3], b[1][2], b[2][1], b[3][0]].all? { |el| el == b[0][3] && el != '-'} #A track
      return true if [b[0][4], b[1][3], b[2][2], b[3][1]].all? { |el| el == b[0][4] && el != '-'} #B track
      return true if [b[1][3], b[2][2], b[3][1], b[4][0]].all? { |el| el == b[1][3] && el != '-'} #B track
      return true if [b[0][5], b[1][4], b[2][3], b[3][2]].all? { |el| el == b[0][5] && el != '-'} #C track
      return true if [b[1][4], b[2][3], b[3][2], b[4][1]].all? { |el| el == b[1][4] && el != '-'} #C track
      return true if [b[2][3], b[3][2], b[4][1], b[5][0]].all? { |el| el == b[2][3] && el != '-'} #C track
      return true if [b[0][6], b[1][5], b[2][4], b[3][3]].all? { |el| el == b[0][6] && el != '-'} #D track
      return true if [b[1][5], b[2][4], b[3][3], b[4][2]].all? { |el| el == b[1][5] && el != '-'} #D track
      return true if [b[2][4], b[3][3], b[4][2], b[5][1]].all? { |el| el == b[2][4] && el != '-'} #D track
      return true if [b[1][6], b[2][5], b[3][4], b[4][3]].all? { |el| el == b[1][6] && el != '-'} #E track
      return true if [b[2][5], b[3][4], b[4][3], b[5][2]].all? { |el| el == b[0][4] && el != '-'} #E track
      return true if [b[2][6], b[3][5], b[4][4], b[5][3]].all? { |el| el == b[2][6] && el != '-'} #F track

      # 0   1    2    3    4    5    6
    #[['D','C', 'B', 'A', '-', '-', '-'], 0
    # ['E','D', 'C', 'B', 'A', '-', '-'], 1
    # ['F','E', 'D', 'C', 'B', 'A', '-'], 2
    # ['-','F', 'E', 'D', 'C', 'B', 'A'], 3
    # ['-','-', 'F', 'E', 'D', 'C', 'B'], 4
    # ['-','-', '-', 'F', 'E', 'D', 'C']] 5
      return true if [b[0][3], b[1][4], b[2][5], b[3][6]].all? { |el| el == b[0][3] && el != '-'} #A track
      return true if [b[0][2], b[1][3], b[2][4], b[3][5]].all? { |el| el == b[0][2] && el != '-'} #B track
      return true if [b[1][3], b[2][4], b[3][5], b[4][6]].all? { |el| el == b[1][3] && el != '-'} #B track
      return true if [b[0][1], b[1][2], b[2][3], b[3][4]].all? { |el| el == b[0][1] && el != '-'} #C track
      return true if [b[1][2], b[2][3], b[3][4], b[4][5]].all? { |el| el == b[1][2] && el != '-'} #C track
      return true if [b[2][3], b[3][4], b[4][5], b[5][6]].all? { |el| el == b[2][3] && el != '-'} #C track
      return true if [b[0][0], b[1][1], b[2][2], b[3][3]].all? { |el| el == b[0][0] && el != '-'} #D track
      return true if [b[1][1], b[2][2], b[3][3], b[4][4]].all? { |el| el == b[1][1] && el != '-'} #D track
      return true if [b[2][2], b[3][3], b[4][4], b[5][5]].all? { |el| el == b[2][2] && el != '-'} #D track
      return true if [b[1][0], b[2][1], b[3][2], b[4][3]].all? { |el| el == b[1][0] && el != '-'} #E track
      return true if [b[2][1], b[3][2], b[4][3], b[5][4]].all? { |el| el == b[2][1] && el != '-'} #E track
      return true if [b[2][0], b[3][1], b[4][2], b[5][3]].all? { |el| el == b[2][0] && el != '-'} #F track

    #endregion

    return false
  end
  
 
end

#region Prove_Line Notes
#
  #I have the intial coordinates now with find_token_coordinates.
  #I need to figure out how to test in a straight line in any
  #direction win_length - 1. The initial coordinate is one of
  #the lengths. My vector will be an array with an X and Y axis
  #+x (positive X) is right -x (negative x) is left
  #+y (positive Y) is down -y (negative y) is up
  #vector = [-1, 1] would be left and down
  #vector = [1, 1] would be rigth and down
  #I have to figure out logic that if my vector has a negative
  #number it contiues negative for each iteration.
  #I need to create a bounding check that if it hits an edge it
  #ignored the result and goes to the next check.
  #I should be able to enter the following when I'm done and get
  #a true or false
  #GameLogic.get_line(game_board, {row:3, col:4}, [1,1]) and it will tell me
  #if the line going right and down is legal and the same token
  #
#endregion