#frozen_string_literal: true
require_relative '../lib/create_board'

describe CreateBoard do
  subject(:board) { described_class.new }
    
  describe 'initial board empty' do
    
     it 'returns all default values'do
     test_board = board.new_board
     expect(test_board.flatten.all?('-'))
    end
  end
end