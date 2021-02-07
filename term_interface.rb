# frozen_string_literal: true

require_relative 'option'

# Terminal Interface
class TerminalInterface
  def initialize(game)
    @game = game
    start_game
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def start_game
    @game.start
    start_game_message(@game.player_name)

    while @game.player_balance.positive?

      @game.place_bet
      round = @game.new_round(@game.player, @game.dealer)

      until @round.finished?
        @game.info_round(round)
        answer = player_respond
        round.player_turn(answer)
      end

      @game.update_balance
      result_round_message(round)

      break unless more_game?
    end
    @game.end_game_message(@game.player_balance, @game.dealer_balance)
    @game.end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  private

  def name_is?
    puts 'Введите свое имя:'
    gets.chomp.to_s
  end

  def more_game?
    puts 'Запустить новый раунд?(y/n)'
    more = gets.chomp.to_s
    more == 'y'
  end

  # rubocop:disable Metrics/MethodLength,
  def player_respond
    puts 'Введите y/n/q. Взять карту/Пропусть ход/Вскрыть карты.'
    resp = gets.chomp.to_s
    if resp == 'y'
      :player_take_card
    elsif resp == 'n'
      :player_skip_turn
    elsif resp == 'q'
      :show_cards
    else
      raise 'Не удалость обработать ответ, попробуйте еще раз.'
    end
  rescue RuntimeError
    retry
  end
  # rubocop:enable Metrics/MethodLength

  def info_round(round)
    puts "Результат игрока:  карты - #{round.show_player_cards} Очки #{round.player_score}"
    puts "Результат диллера: карты - #{round.show_dealer_cards} Очки #{round.dealer_score}" if round.finished?
  end

  # rubocop:disable Metrics/MethodLength
  def result_round_message(round)
    puts "\nРаунд закончен!\n"
    info_round(round)
    result =  case round.result
              when :player_wins
                'Игрок выииграл!'
              when :dealer_wins
                'Диллер выиграл!'
              when :draw
                'Ничья!'
              end
    puts "\nРезультат раунда - #{result}"
  end
  # rubocop:enable Metrics/MethodLength

  def start_game_message(user)
    puts "#{user.capitalize} игра началась!"
  end

  def end_game_message(user, balance)
    puts "Игра закончена #{user}, ваш баланс #{balance}!"
  end

  def greatings(player_balance, dealer_balance)
    puts '*' * 47
    puts '* Начало новога раунда. Размещение ставки 10$ *'
    puts '*' * 47
    puts "Баланс: Игрок #{player_balance}. Диллер #{dealer_balance}\n"
  end
end
