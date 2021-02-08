# frozen_string_literal: true

# player class
class Player
  attr_accessor :balance, :score, :cards, :name

  def initialize(name = nil)
    @name = name
    @balance = 0
    @score = 0
    @cards = []
  end

  def calculate_result
    total = @cards.sum(&:cost)
    @cards.select(&:ace?).each do
      total -= 10 if total > 21
    end
    @score = total
  end

  def show_cards
    result = ''
    @cards.each { |card| result += "#{card.suit}#{card.rank}(#{card.cost}) " }
    result.to_s
  end
end
