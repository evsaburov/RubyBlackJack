# frozen_string_literal: true

require_relative 'player'
require_relative 'cards'
require_relative 'dealer'
require_relative 'game'
require_relative 'term_interface'

# main
class BlackJack
  def initialize
    player = Player.new('Sergey')
    dealer = Dealer.new
    game = Game.new(player, dealer)

    TerminalInterface.new(game)
  end
end
