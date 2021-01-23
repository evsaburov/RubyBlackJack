require_relative 'option'
require_relative 'round'

class Game

  START_PLAYER_BALANCE = 100
  START_DILLER_BALANCE = 100

  attr_reader :player_name, :player_balance, :round

  def initialize
    @player_balance = START_PLAYER_BALANCE
    @player_name = option.name_is?
  end

  def start_game
    while player_balance.zero?

      place_bet
      @round = Round.new


      until round.end?
        option.info_round(round)
        respond = option.player_respond
        round.player_turn(respond)
      end

      update_balance
      option.result_round(round)

      more_game = option.more_game?
      break unless more_game

  end

  puts "Goodbay #{@player_name}, Balance #{@player_balance}"

  def place_bet
    @player_balance -= 10
  end

  def update_balance
    if round.result == 'win'
      @player_balance += 10
    elsif round.result == 'lose'
      @player_balance -= 10
    end
  end



end

game = Game.new
game.start_game


