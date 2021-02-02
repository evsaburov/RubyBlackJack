require_relative 'option'
require_relative 'round'
require 'pry'

class Game

  SATRT_BALANCE = 100
  BET = 10

  attr_reader :player_name, :player_balance, :round

  def initialize
    @player_balance = SATRT_BALANCE
    @dealer_balance = SATRT_BALANCE
    @player_name = Option.name_is?
  end

  def start_game
    
    Option.start_game(@player_name)

    while player_balance > 0
      
      place_bet
      @round = Round.new
      
      until round.finished?
        Option.info_round(round)
        answer = Option.player_respond
        round.player_turn(answer)
      end
      
      update_balance
      Option.result_round(round)

      more_game = Option.more_game?
      break unless more_game

    end

    Option.end_game(@player_name, @player_balance)

  end

  private
  
  def place_bet
    @player_balance -= BET
    @dealer_balance -= BET
    Option.greatings(@player_balance, @dealer_balance)
  end

  def update_balance
    if round.result == :player_wins
      @player_balance += 2 * BET
    elsif round.result == :dealer_wins
      @player_balance += 2 * BET
    elsif round.result == :drow
      @player_balance += BET
      @dealer_balance += BET
    end
  end

end

game = Game.new
game.start_game


