#frozen_string_literal: true

require_relative '../lib/create_player'

describe CreatePlayer do
  subject(:test_player) {described_class.new('x', 7)}
  
  it 'returns proper token ' do
    #test_player = CreatePlayer.new('x', 7)
    expect(test_player.token).to eq('x')
  end

  it 'returns legal column value' do
    #subject(:test_player) {described_class.new('x', 7)}  
    test_board = Array.new(6) { Array.new(7, '-') } 
    allow(test_player).to receive(:gets).and_return("5\n")
    expect(test_player.player_input(test_board)).to eq(5)
  end

  it 'returns nil if invalid number passed but I have to pass a valid number in the end or get caught in an infinite loop' do
    test_board = Array.new(6) { Array.new(7, '-') }
    allow(test_player).to receive(:gets).and_return("1134\n", "3\n")
    expect(test_player.player_input(test_board)).to eq(3)
  end

  context 'test the random_input' do
    it 'returns a number between 1 and column width' do
      expect(test_player.random_input).to be_positive.and be <= 7
    end
  end
end

