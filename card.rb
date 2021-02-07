# frozen_string_literal: true

# One card class
class Card
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
