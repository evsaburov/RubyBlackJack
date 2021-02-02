# frozen_string_literal: true

# Helper function module
module Option
  def self.name_is?
    puts 'Введите свое имя:'
    gets.chomp.to_s
  end

  def self.more_game?
    puts 'Запустить новый раунд?(y/n)'
    more = gets.chomp.to_s
    more == 'y'
  end

  # rubocop:disable Metrics/MethodLength,
  def self.player_respond
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

  def self.info_round(round)
    puts "Результат игрока:  карты - #{round.show_player_cards} Очки #{round.player_score}"
    puts "Результат диллера: карты - #{round.show_dealer_cards} Очки #{round.dealer_score}" if round.finished?
  end

  # rubocop:disable Metrics/MethodLength
  def self.result_round(round)
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

  def self.start_game(user)
    puts "#{user.capitalize} игра началась!"
  end

  def self.end_game(user, balance)
    puts "Игра закончена #{user}, ваш баланс #{balance}!"
  end

  def self.greatings(player_balance, dealer_balance)
    puts '*' * 47
    puts '* Начало новога раунда. Размещение ставки 10$ *'
    puts '*' * 47
    puts "Баланс: Игрок #{player_balance}. Диллер #{dealer_balance}\n"
  end
end
