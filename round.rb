require_relative 'round'

class Round

  def initialize
    @cards =
    @player_cards = []
    @player_score = 0
    @dialer_cards = []
    @dialer_score = 0
    @finished = false
    start_turn
  end

  def player_turn(answer)
    return if finished?

    case answer
    when
      player_take_carrd
    when :dealer_turn
      dialer_turn
    end

  end







  def finished?
    @finished
  end







end

