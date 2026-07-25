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

#I have another idea I am going to try. I will have to do some thinking to figure
#out how to make it work. Here is what I have thought up so far and I'm writing it
#down now because I won't be working on it until tomorrow. So here are my notes.
#Have a for loop that runs seven times. I don't need to deal with the 8th option of
#straight up. I will start at the location the token drops and then check each of
#the seven directions to see if the same type of token extends three spaces out.
#If I get three tokens that match the beginning token I have four in a row.
#If I hit an invalid location or a different token or empty space then I will use
#next to go to the next iteration of the for loop. If it ever does find four in a
#row it will return true and end the check immediately. I think I can do it this
#way. I'll work on it tomorrow.