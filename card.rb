# frozen_string_literal: true

# One card class
class Card
  SUITS = ["\u2660", "\u2666", "\u2665", "\u2663"].freeze
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze

  attr_reader :rank, :suit
  attr_accessor :cost

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @cost = cost_is(rank)
  end

  def picture?
    %(J Q K).include? rank
  end

  def ace?
    ['A'].include? rank
  end

  def cost_is(rank)
    return 10 if picture?
    return 11 if ace?

    rank.to_i
  end
end
