require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'
require './lib/card_generator'

class FlashCardRunner

  attr_reader :round

  def initialize
    @deck = create_deck
    @round = Round.new(@deck)

  end

  def create_deck
    cards = CardGenerator.new("cards.txt").cards

    Deck.new(cards)
  end
end

runner = FlashCardRunner.new
runner.round.start
