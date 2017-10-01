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
    # card_1 = Card.new('What is 5 + 5?', '10')
    # card_2 = Card.new('What is Rachel\'s favorite animal?', 'baboon')
    # card_3 = Card.new( 'What is Mike\'s middle name?', 'nobody knows')
    # card_4 = Card.new( 'What cardboard cutout lives at Turing?', 'Justin Bieber')
    # Deck.new([card_1, card_2, card_3, card_4])
    Deck.new(cards)
  end
end

runner = FlashCardRunner.new
runner.round.start
