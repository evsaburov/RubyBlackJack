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



        more_game = option.more_game?
        break unless more_game
      end

  end

  puts "Goodbay #{@player_name}, Balance #{@player_balance}"

  def place_bet
    # code here
  end



end

game = Game.new
game.start_game


