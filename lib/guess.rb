class Guess

  attr_reader :card, :response

  def initialize(card, response)
    @card = card
    @response = response
    @feedback = feedback
  end

  def correct?
        @response == @card.answer
  end

  def feedback
    if correct?
      "correct!"

    else
      "incorrect"
    end
  end
end
