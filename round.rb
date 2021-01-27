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
  end

  def calculate_player_result
    @player_cards.each { |card| @player_score += card.cost}
  end

  def calculate_dealer_result
    @dialer_cards.each { |card| @dialer_score += card.cost}
  end

  def dealer_turn
    while dealer_score <= 17
      calculate_dealer_result
      @dealer_cards << deck.one_card
    end
    check_result_after_dealer_turn
  end

  def player_take_card

  end

  def player_turn(answer)
    return if finished?
    case answer
    when :player_take_card
      player_get_card
    when :dealer_turn
      dialer_turn
    end
    # if answer == :player_take_card
    #   player_get_card
    #  elsif nswer == :dealer_turn
    #   dialer_turn
    # end
  end

  def finished?
    @finished
  end

  def check_result_after_player_turn
  end

  def check_result_after_dealer_turn
  end

end

