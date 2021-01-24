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

  def info_round
    # code here
  end



end
