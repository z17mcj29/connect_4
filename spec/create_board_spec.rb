#frozen_string_literal: true
require_relative '../lib/create_board'

describe CreateBoard do
  subject(:board) { described_class.new }
    
  describe 'initial board empty' do
    
     it 'returns all default values'do
     test_board = board.new_board
     #need to find out the actual way to test whata an array contains.
     expect(test_board[0][0].include?('-'))
    end
  end
end