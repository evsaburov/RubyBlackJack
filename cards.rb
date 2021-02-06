# frozen_string_literal: true

require_relative('card')

# class Cards
class Cards
  def initialize
    @cards = []
    suits = ["\u2660", "\u2666", "\u2665", "\u2663"]
    ranks = %w[A 2 3 4 5 6 7 8 9 10 J Q K]

    suits.each do |suit|
      ranks.each do |rank|
        card = Card.new(rank, suit)
        @cards << card
      end
    end
    @cards.shuffle!
  end

  def one_card
    @cards.empty? ? nil : @cards.shift
  end
end
