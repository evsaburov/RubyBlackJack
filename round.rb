# frozen_string_literal: true

require_relative 'cards'

# Round class
# rubocop:disable Metrics/ClassLength
class Round
  attr_accessor :player, :dealer, :finished, :result

  def initialize(player, dealer, cards)
    @cards = cards
    @player = player
    @dealer = dealer
    @player.cards = []
    @dealer.cards = []
    @player.score = 0
    @dealer.score = 0
    @finished = false
    @result = false
    start_turn
  end

  def start_turn
    2.times do
      @player.cards << @cards.one_card
      @dealer.cards << @cards.one_card
    end
    calculate_player_result
    calculate_dealer_result
  end

  def calculate_player_result
    @player.score = 0
    @player.cards.each do |card|
      if card.rank == 'A'
        summ = 0
        @player.cards.each { |c| summ += c.cost }
        card.cost = (summ >= 21 ? 1 : 11)
      end
      @player.score += card.cost
    end
  end

  def calculate_dealer_result
    @dealer.score = 0
    @dealer.cards.each do |card|
      if card.rank == 'A'
        summ = 0
        @dealer.cards.each { |c| summ += c.cost }
        card.cost = (summ >= 21 ? 1 : 11)
      end
      @dealer.score += card.cost
    end
  end

  def player_take_card
    return if @player.cards.length == 3

    @player.cards << @cards.one_card
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
    if @player.score > 21
      @result = :dealer_wins
      @finished = true
    end
    show_after_3_cards
  end

  def dealer_turn
    return if finished?

    if @dealer.score <= 17
      @dealer.cards << @cards.one_card
      calculate_dealer_result
    end
    check_after_dealer_turn
    show_after_3_cards
  end

  def show_after_3_cards
    show_cards if @player.cards.length == 3 && @dealer.cards.length == 3
  end

  def check_after_dealer_turn
    if @dealer.score > 21
      @result = :player_wins
      @finished = true
    end
    calculate_result_round
  end

  def calculate_result_round
    delta = @player.score - @dealer.score
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
    @player.cards.each { |card| result += "#{card.suit}#{card.rank}(cast=#{card.cost}) " }
    result.to_s
  end

  def show_dealer_cards
    result = ''
    @dealer.cards.each { |card| result += "#{card.suit}#{card.rank}(cast=#{card.cost}) " }
    result.to_s
  end
end
# rubocop:enable Metrics/ClassLength
