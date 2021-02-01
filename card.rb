class Card
  attr_reader :rank, :suit, :cost

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @cost = cost_is(rank)
  end

  def picture?
    %[J Q K].include? rank
  end

  def ace?
    ['A'].include? rank
  end

  def cost_is(rank)
    return 10 if picture?
    return 11 if ace?
    rank.to_i
  end

end

class Deck

  def initialize

    @deck = []
    suits = ["\u2660", "\u2666", "\u2665", "\u2663"]
    ranks = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

    suits.each do |suit|
      ranks.each do |rank|
        card = Card.new(rank, suit)
        @deck << card
      end
    end
    @deck.shuffle!
  end

  def one_card
    @deck.empty? ? nil : @deck.shift
  end

end
