require_relative 'round'
require_relative 'card'

class Round

  def initialize
    @cards = Deck.new
    @player_cards = []
    @player_score = 0
    @dealer_cards = []
    @dealer_score = 0
    @finished = false
    start_turn
  end

  def start_turn
    2.times do
      @player_cards << @cards.one_card
      @dialer_cards << @cards.one_card
    end
    calculate_player_result
    # calculate_dealer_result
  end

  def calculate_player_result
    @player_cards.each { |card| @player_score += card.cost}
  end

  def calculate_dealer_result
    @dealer_cards.each { |card| @dialer_score += card.cost}
  end
  
  def player_get_card
    @player_cards << @cards.one_card
    calculate_player_result
    check_after_player_turn
  end

  def dealer_turn
    while dealer_score <= 17
      calculate_dealer_result
      @dealer_cards << deck.one_card
    end
    check_after_dealer_turn 
  end


  def player_turn(answer)
    return if finished?
    answer ? player_get_card : dealer_turn
  end

  def finished?
    @finished
  end

  def check_after_player_turn
    if @player_turn > 21
      @result = :player_wins
      @finished = true
    end
  end

  def check_after_dealer_turn
    if @player_turn > 21
      @result = :dealer_wins
      @finished = true
    end
  end

end

