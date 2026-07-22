#frozen_string_literal: true
require_relative '../lib/create_board'
require_relative '../lib/add_token'

describe CreateBoard do
  #subject(:board) { described_class.new }
    
  describe 'initial board empty' do
    
     it 'returns all default values'do
     test_board = CreateBoard.new_board(6,7)
     expect(test_board.flatten.all?('-'))
    end
  end
  
  
end

describe AddToken do
    it 'puts tokens in correct spot' do
      test_board = CreateBoard.new_board(6,7)
      AddToken.drop_token(test_board, 'x', 3)
      AddToken.drop_token(test_board, 'o', 3)
      expect(test_board[4][3]).to eq('o')
      
    end
  end