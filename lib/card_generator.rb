require './lib/card'
class CardGenerator

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    file =File.read(filename)
    lines = file.split("\n")
    lines.map do |line|
      split = line.split(",")
      card = Card.new(split[0], split[1])
    end
  end
end
