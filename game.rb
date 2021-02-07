# frozen_string_literal: true

require_relative 'option'
require_relative 'round'
require 'pry'

#class game
class Game
  SATRT_BALANCE = 100
  BET = 10

  attr_reader :player_name, :player_balance, :round

  def initialize(player, dealer); end

  def new_round
    Round.new
  end

  def start
    @player_balance = SATRT_BALANCE
    @dealer_balance = SATRT_BALANCE
  end

  def end
    @player_balance = 0
    @dealer_balance = 0
  end

  def place_bet
    @player_balance -= BET
    @dealer_balance -= BET
    greatings(@player_balance, @dealer_balance)
  end

  def update_balance
    if round.result == :player_wins
      @player_balance += 2 * BET
    elsif round.result == :dealer_wins
      @player_balance += 2 * BET
    elsif round.result == :drow
      @player_balance += BET
      @dealer_balance += BET
    end
  end

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

  def start_game(user)
    puts "#{user.capitalize} игра началась!"
  end

  def end_game(user, balance)
    puts "Игра закончена #{user}, ваш баланс #{balance}!"
  end

  def greatings(player_balance, dealer_balance)
    puts '*' * 47
    puts '* Начало новога раунда. Размещение ставки 10$ *'
    puts '*' * 47
    puts "Баланс: Игрок #{player_balance}. Диллер #{dealer_balance}\n"
  end
end
