module Option
  def name_is?
    puts 'Введите свое имя:'
    name = gets.chomp.to_s
  end

  def more_game?
    puts 'Запустить новую игру?(y/n)'
    more = gets.chomp.to_s
    result = more == 'y' ? true : false
  end

  
end
