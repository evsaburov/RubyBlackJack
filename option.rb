module Option

  def self.name_is?
    puts 'Введите свое имя:'
    name = gets.chomp.to_s
  end

  def more_game?
    puts 'Запустить новую игру?(y/n)'
    more = gets.chomp.to_s
    more == 'y'
  end

  def self.player_respond
    puts 'Введите y/n/q. Взять карту/Пропусть ход/Вскрыть карты.'
    resp = gets.chomp.to_s
    # resp == 'y'
    if resp == 'y'
      :player_take_card
    elsif resp == 'n'
      :player_skip_turn
    elsif resp == 'q'
      :show_cards
    else
      raise "Не удалость обработать ответ, попробуйте еще раз."
    end
  rescue RuntimeError
    retry
  end

  # "%05d" % 

  def self.info_round(round)
    puts "Результат игрока:  карты - #{round.show_player_cards} Очки #{round.player_score}"
    puts "Результат диллера: карты - #{round.show_dealer_cards} Очки #{round.dealer_score}"

    if round.finished?
    end

  end
end