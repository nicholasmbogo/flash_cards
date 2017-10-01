require 'pry'
require_relative 'guess'
class Round

  attr_reader :deck, :guesses
  attr_accessor :current_card

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def record_guess(response)
    guess = Guess.new(current_card, response)
    guesses << guess
    @deck.cards.shift

    return guesses.last
  end

  def number_correct
    feedback_guess = guesses.select do |guess|
      guess.feedback == "correct!"
    end
    feedback_guess.count
  end

  def percent_correct
    (number_correct.to_f / guesses.count.to_f * 100.0).to_i
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"

    count = 1
    original_count = deck.count
    while count <= original_count
      puts "This is card number #{count} out of #{original_count} cards"
      puts "Question: #{current_card.question}"
      response = $stdin.gets.chomp
       guess = record_guess(response)
       count += 1
      puts guess.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{original_count} for a score of #{percent_correct}."

  end
end
