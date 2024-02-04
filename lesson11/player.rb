class Player
  attr_accessor :money, :name, :cards

  def initialize(name)
    @money = 100;
    @cards = []
    @points = 0
    @name = name
  end

  def add_card(card)
    @cards.push(card)
    get_count_points(card)
  end

  def get_count_points(card)
    if (card.value == 'Т') 
      @points += @points + 11 <= 21 ? 11 : 1
    else 
      @points += card.point
    end
  end

  def show_card
    @cards.each { |card| puts card.view}
  end
  

end
