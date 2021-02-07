# frozen_string_literal: true

# player class
class Player
  attr_accessor :balance, :score, :cards, :name

  def initialize(name)
    @name = name
    @balance = 0
    @score = 0
    @cards = []
  end

  def cards; end

  def score; end

  def take_card; end
end
