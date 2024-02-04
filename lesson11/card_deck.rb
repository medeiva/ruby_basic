class CardDeck

    VAlUES = ['Т', 'К', 'Д', 'В', '10', '9', '8', '7', '6', '5', '4', '3', '2']
    SUITS = ['черви', 'пики', 'трефы', 'бубны']
    POINTS = {'Т' => 11, 'К'=> 10, 'Д'=> 10, 'В'=> 10, '10'=> 10, '9'=> 9, '8'=> 8, '7'=> 7, '6'=> 6, '5'=> 5, '4'=> 4, '3'=> 3, '2'=> 2}

    def initialize
        @cards = []
        SUITS.each  do |suit|
            VAlUES.each  do |value|
                @cards.push(Card.new(value, suit, POINTS[value]));
            end
        end
    end

    def take_card
        @cards.delete(@cards.sample)
    end

end