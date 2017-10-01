require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_card_generator_exists
    card = CardGenerator.new("cards.txt")

    assert_instance_of CardGenerator, card
  end

  def test_can_generate_a_list_of_card_instances
    card = CardGenerator.new("cards.txt")
    cards = card.cards

    assert_equal 4, cards.length
    assert_instance_of Card, cards[1]#|| first
    assert_equal "10", cards[0].answer
    assert_equal "What is 5 + 5?", cards[0].question
  end
end
