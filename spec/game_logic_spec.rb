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

  context 'Returns "true" game Won' do
    it 'returns game won' do
      test_board = [['-', '-', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],
                    ['-', 'x', 'x', 'x', 'x', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],]
    expect(GameLogic.game_win(test_board, 2)).to eq(true)
    end
  end
  context 'Returns "true" game Won' do
    it 'returns game won' do
      test_board = [['-', '-', '-', '-', '-', '-', '-'],
                    ['-', 'x', '-', '-', '-', '-', '-'],
                    ['-', '-', 'x', '-', '-', '-', '-'],
                    ['-', '-', '-', 'x', '-', '-', '-'],
                    ['-', '-', '-', '-', 'x', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],]
    expect(GameLogic.game_win(test_board, 2)).to eq(true)
    end
  end
  context 'Returns "true" game Won' do
    it 'returns game won up right direction' do
      test_board = [['-', '-', '-', '-', 'x', '-', '-'],
                    ['-', '-', '-', 'x', '-', '-', '-'],
                    ['-', '-', 'x', '-', '-', '-', '-'],
                    ['-', 'x', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],
                    ['-', '-', '-', '-', '-', '-', '-'],]
    expect(GameLogic.game_win(test_board, 2)).to eq(true)
    end
  end


end