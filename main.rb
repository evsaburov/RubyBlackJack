require_relative 'option'
require_relative 'round'

class Game

  SATRT_BALANCE = 100
  BET = 10


  attr_reader :player_name, :player_balance, :round

  def initialize
    @player_balance = SATRT_BALANCE
    @dialer_balance = SATRT_BALANCE
    @player_name = option.name_is?
  end

  def start_game

    while player_balance.zero?

      place_bet

      @round = Round.new

      until round.finished?
        option.info_round(round)
        answer = option.player_respond
        round.player_turn(answer)
      end

      update_balance

      option.result_round(round)

      more_game = option.more_game?
      break unless more_game

    end

    puts "RESULT GAME - #{@player_name}, Balance #{@player_balance}"

    private

    def place_bet
      @player_balance -= BET
    end

  end

  def update_balance
    if round.result == :win
      @player_balance += 2 * BET
    elsif round.result == :lose
      @player_balance -= BET
    end
  end



end

game = Game.new
game.start_game


