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
    @player_cards.each do |card|
      if card.rank == 'A'
        summ = 0
        @player_cards.each { |card| summ += card.cost }
        card.cost = (summ >= 21 ? 1 : 11)
      end
      @player_score += card.cost
    end
  end

  def calculate_dealer_result
    @dealer_score = 0
    @dealer_cards.each do |card|
      if card.rank == 'A'
        summ = 0
        @dealer_cards.each { |card| summ += card.cost }
        card.cost = (summ >= 21 ? 1 : 11)
      end
      @dealer_score += card.cost
    end
  end

  def player_take_card
    return if @player_cards.length == 3

    @player_cards << @cards.one_card
    calculate_player_result
    check_after_player_turn
  end

  def player_turn(answer)
    return if finished?

    case answer
    when :player_take_card
      show_after_3_cards
      player_take_card
    when :player_skip_turn
      dealer_turn
    when :show_cards
      calculate_result_round
    end
  end

  def check_after_player_turn
    if @player_score > 21
      puts 'Больше 21, противник выиграл'
      @result = :dealer_wins
      @finished = true
    end
    show_after_3_cards
  end

  def dealer_turn
    return if finished?

    if @dealer_score >= 17
      check_after_dealer_turn
    else
      @dealer_cards << @cards.one_card
      calculate_dealer_result
      check_after_dealer_turn
    end
    show_after_3_cards
  end

  def show_after_3_cards
    show_cards if @player_cards.length == 3 && @dealer_cards.length == 3
  end

  def check_after_dealer_turn
    if @dealer_score > 21
      puts 'Больше 21, противник выиграл'
      @result = :player_wins
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
      @result = :draw
    end
    @finished = true
  end

  def show_cards
    calculate_result_round
  end

  def finished?
    @finished
  end

  def show_player_cards
    result = ''
    @player_cards.each { |card| result += "#{card.suit}#{'%2s' % card.rank}(cast=#{'%02d' % card.cost}) " }
    result.to_s
  end

  def show_dealer_cards
    result = ''
    @dealer_cards.each { |card| result += "#{card.suit}#{'%2s' % card.rank}(cast=#{'%02d' % card.cost}) " }
    result.to_s
  end
end
