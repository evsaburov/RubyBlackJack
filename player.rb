# frozen_string_literal: true

#player class
class Player
  attr_reader :name
  attr_accessor :balance, :score, :cards

  def initialize(name)
    @name = name
    @balance = 0
    @score = 0
    @cards = []
  end
end
