# frozen_string_literal: true

# Terminal Interface
class TerminalInterface
  def initialize(game)
    @game = game
    @player = @game.player
    @player.name = name_is?
    @dealer = @game.dealer
    start_game
  end

  # rubocop:disable Metrics/MethodLength
  def start_game
    @game.start
    start_game_message

    while @player.balance.positive?

      @game.place_bet
      greatings
      round = @game.new_round

      until round.finished?
        info_round(round)
        answer = player_respond
        round.player_turn(answer)
      end

      @game.update_balance
      result_round_message(round)

      break unless more_game?
    end
    end_game_message
    @game.end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def name_is?
    puts 'Введите свое имя:'
    gets.chomp.to_s.capitalize
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
    puts "Результат игрока:  карты - #{@player.show_cards} Очки #{@player.score}"
    puts "Результат диллера: карты - #{@dealer.show_cards} Очки #{@dealer.score}" if round.finished?
  end

  # rubocop:disable Metrics/MethodLength
  def result_round_message(round)
    puts "\nРаунд закончен!\n"
    info_round(round)
    result =  case round.result
              when :player_wins
                "#{@player.name} выииграл!"
              when :dealer_wins
                "#{@dealer.name} выииграл!"
              when :draw
                'Ничья!'
              end
    puts "\nРезультат раунда - #{result}.\n#{@player.name} #{@player.balance}$. #{@dealer.name} #{@dealer.balance}$\n"
  end
  # rubocop:enable Metrics/MethodLength

  def start_game_message
    puts "#{@player.name} игра началась!"
  end

  def end_game_message
    puts "Игра закончена #{@player.name}, ваш баланс #{@player.balance}!"
  end

  def greatings
    puts '*' * 47
    puts '* Начало новога раунда. Размещение ставки 10$ *'
    puts '*' * 47
    puts "Баланс: #{@player.name} #{@player.balance}$. #{@dealer.name} #{@dealer.balance}$\n"
  end
end
