# I am going to try and see if I can make it so that from this main file I can simply type
# connect_4() to play the game and have everything else in other files.
# Need to develop a game plan for what I need to do to build this game. I think I know all
# of the needed steps, but I will write them out here to give me a game plan going forward.

# Create the 7 wide 6 deep board
#   Function to drop a token to the bottom of the board

# Game Logic
#   If same token is the same 4 across horizontal, verticle, or diagonal that side wins.
#   AI opponent who will drop tokens automatically on their turn.
#   Test and verify each turn if the game has run out of legal moves causing a tie

# I think that is everything. I will start building it and see if anything else comes
#  up. This is my first game built using testing so we will see how it goes.


require_relative './lib/create_board'
require_relative './lib/print_board'
require_relative './lib/add_token.rb'

test_board = CreateBoard.new_board(6, 7)
#PrintBoard.print_board(test_board)
AddToken.drop_token(test_board, 'x', 3)
#PrintBoard.print_board(test_board)
AddToken.drop_token(test_board, 'o', 3)
PrintBoard.print_board(test_board)


#Game Start Setup
  #Create Board. Decide row and column lengths.
  #Decide the size of the win-condition. Default 4
  #Default tokens X and O, but give option to change them
  game_board = CreateBoard.new_board(6, 7)
  player_one = Player.new_player('x')
  player_two = Player.new_player('o')

#Game Loop
#Player Input
#Game Logic Runs
#Visual Elements run
#Loop repeats or game ends.