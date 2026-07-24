

class GameLogic
  def self.game_tie(board)
    if board[0].include?('-') then
      return false
    else
      return true
    end
  end
end