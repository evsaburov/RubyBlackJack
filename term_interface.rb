# frozen_string_literal: true

require_relative 'option'
require_relative 'round'

# Terminal Interface
class TerminalInterface
  def initialize(game)
    @game = game
    start_game
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def start_game
    @game.start
    Option.start_game_message(@game.player_name)
    
    while @game.player_balance.positive?
      @game.place_bet
      round = @game.new_round
      until @round.finished?
        Option.info_round(round)
        answer = Option.player_respond
        round.player_turn(answer)
      end

      @game.update_balance
      Option.result_round(round)

      more_game = Option.more_game?
      break unless more_game
    end
    Option.end_game(@game.player_balance, @game.dealer_balance)
    @game.end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
