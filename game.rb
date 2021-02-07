# frozen_string_literal: true

require_relative 'round'
require 'pry'

# class game
class Game
  SATRT_BALANCE = 100
  BET = 10

  attr_reader :round
  attr_accessor :player, :dealer, :cards

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @cards = Cards.new
  end

  def new_round
    @round = Round.new(player, dealer, cards)
  end

  def start
    @player.balance = SATRT_BALANCE
    @dealer.balance = SATRT_BALANCE
  end

  def end
    @player.balance = 0
    @dealer.balance = 0
  end

  def place_bet
    @player.balance -= BET
    @dealer.balance -= BET
  end

  def update_balance
    if round.result == :player_wins
      @player.balance += 2 * BET
    elsif round.result == :dealer_wins
      @player.balance += 2 * BET
    elsif round.result == :drow
      @player.balance += BET
      @dealer.balance += BET
    end
  end
end
