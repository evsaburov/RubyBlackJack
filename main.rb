require_relative 'option'
require_relative 'round'

class Game

  SATRT_PLAYER_BALANCE = 100
  SATRT_DILLER_BALANCE = 100

  def initialize
    @player_balance = SATRT_PLAYER_BALANCE
    @player_name = option.name_is?
  end

  def start

    while SATRT_PLAYER_BALANCE.positive?

    end


  end

  puts "Goodbay #{@player_name}, Balance #{@player_balance}"
end

game = Game.new
game.start


