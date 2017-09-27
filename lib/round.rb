require_relative 'guess'
class Round

  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(response)
    guesses << Guess.new(current_card, response)
    @deck.cards.shift
    return guesses.last
  end

  def number_correct
    feedback_guess = guesses.select do |guess|
      guess.feedback == "correct!"
    end
    feedback_guess.count
  end
end
