module Option
  def name_is?
    puts 'Введите свое имя:'
    name = gets.chomp.to_s
  end

  def more_game?
    puts 'Запустить новую игру?(y/n)'
    more = gets.chomp.to_s
    more == 'y'
  end

  def player_respond
    puts 'Введите y/n, чтобы взять карту, или закончить ход.'
    resp = gets.chomp.to_s
    resp == 'y'
  end

  def result_round(round)
    puts "Результат игрока: карты - #{round.player_cards}. Очки #{round.player_score}"
    puts "Результат диллера: карты - #{round.dealer_cards}. Очки #{round.dealer_cards}"

    if round.finished?
    end

  end



end
