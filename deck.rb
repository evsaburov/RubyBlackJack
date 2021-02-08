# frozen_string_literal: true

require_relative('card')

# class Cards
class Deck
  def initialize
    @cards = []

    suits = Card.suits
    ranks = Card.ranks

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
