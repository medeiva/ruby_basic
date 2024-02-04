class Card
  attr_reader :point, :value, :view

  def initialize (value, suit, point)
    @value = value
    @suit = suit
    @point = point
  end

  def view
    "#{@value} #{@suit}"
  end
end