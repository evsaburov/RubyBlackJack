require_relative 'round'
require_relative 'card'

class Round

  attr_reader :result, :player_cards, :dealer_cards, :player_score, :dealer_score

  def initialize
    @cards = Deck.new
    @player_cards = []
    @player_score = 0
    @dealer_cards = []
    @dealer_score = 0
    @finished = false
    @result
    start_turn
  end
  
  def start_turn
    2.times do
      @player_cards << @cards.one_card
      @dealer_cards << @cards.one_card
    end
    calculate_player_result
    calculate_dealer_result
  end
  
  def calculate_player_result
    @player_score = 0
    @player_cards.each { |card| @player_score += card.cost }
  end
  
  def calculate_dealer_result
    @dealer_score = 0
    @dealer_cards.each { |card| @dealer_score += card.cost }
  end
  
  def player_take_card
    @player_cards << @cards.one_card
    calculate_player_result
    check_after_player_turn
  end
  
  def player_turn(answer)
    puts 'player_turn' 
    return if finished?
    case answer
      when :player_take_card
        player_take_card
      when :player_skip_turn
        dealer_turn
      when :show_cards
        calculate_result_round
    end
  end
  
  def check_after_player_tur
    puts 'check_after_player_tur' 
    binding.pry
    if @player_score > 21
      @result = :player_wins
      @finished = true
    end
  end

  def dealer_turn
    puts 'dealer_turn' 
    #Если очков больше 17, пропустим ход, иначе возмем карту.
    if @dealer_score >= 17
      check_after_dealer_turn 
    else
      @dealer_cards << @cards.one_card
      calculate_dealer_result
      #ход переходит игроку
    end
  end
  
  def check_after_dealer_turn
    puts 'check_after_dealer_turn' 
    if @dealer_score > 21
      @result = :dealer_wins
      @finished = true
    end
    calculate_result_round
  end
  
  def calculate_result_round
    delta = @player_score - @dealer_score
    if delta.positive?
      @result = :player_wins
    elsif delta.negative?
      @result = :dealer_wins
    elsif delta.zero?
      @result = :drow 
    end
    @finished = true
  end

  def finished?
    @finished
  end


  def show_player_cards
    result = ''
    @player_cards.each { |card| result += "#{card.suit}#{"%1s"%card.rank}(cast=#{"%02d"%card.cost}) " }
    return result.to_s
  end

  def show_dealer_cards
    result = ''
    @dealer_cards.each { |card| result += "#{card.suit}#{"%1s"%card.rank}(cast=#{"%02d"%card.cost}) " }
    return result.to_s
  end


end

