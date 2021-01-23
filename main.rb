require_relative 'option'
require_relative 'round'

class Game

  SATRT_PLAYER_BALANCE = 100
  SATRT_DILLER_BALANCE = 100
  CARD_DECK = {
    "2\u2664" => 2,
    "3\u2664" => 3,
    "4\u2664" => 4,
    "5\u2664" => 5,
    "6\u2664" => 6,
    "7\u2664" => 7,
    "8\u2664" => 8,
    "9\u2664" => 9,
    "10\u2664" => 10,
    "J\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
    "2\u2664" => 2,
  }.freeze

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


