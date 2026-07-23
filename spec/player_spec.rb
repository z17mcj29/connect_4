#frozen_string_literal: true

require_relative '../lib/create_player'

describe CreatePlayer do
  
  it 'returns proper token ' do
    test_player = CreatePlayer.new('x')
    expect(test_player.token).to eq('x')
  end

  it 'returns legal column value'
  subject(:test_player) {described_class.new('x', 7)}
  test_value = CreatePlayer.player_input
  #I'm still struggling with figuring the proper way to
  #do this test.
  allow(test_player).to receive(:gets).and_return("5\n")
  #choice to return a specific number out of my range. Will
  #have to research that.
  expect(test_player.player_input).to eq(5)
end

