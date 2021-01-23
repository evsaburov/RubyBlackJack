class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
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
  end


  def output_deck

  end

  def shuffle

  end

  def deal

  end

end

