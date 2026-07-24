#frozen_string_literal: true

require_relative '../lib/game_logic'

describe GameLogic do
  subject(:logic) {described_class.new}
  context 'Tie conditions' do
    it 'all top level elements are filled' do
      test_board = [[1,1,1,1,1],
                    [1,1,1,1,1]]
      expect(GameLogic.game_tie(test_board)).to eq(true)
    end
  end
  context 'Game continues' do
    it 'returns false, game continues' do
    test_board = [[1,1,'-',1,1],
                    [1,1,1,1,1]]
    expect(GameLogic.game_tie(test_board)).to eq(false)
    end
  end
end