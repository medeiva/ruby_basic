class Game

  def initialize
    @card_deck = CardDeck.new
  end

  def start
    puts "Добро пожаловать в игру 21"
    create_palyers

    show_menu
  end
  
  def create_palyers
    create_diller
    deal_cards_players
  end

  def create_user
    create_palyer(get_name)
    show_money(@player)
    deal_cards(@player, 2)
    puts "Ваши карты: "
    @player.show_card
  end

  def create_diller
    create_palyer('diller')
    deal_cards(@diller, 2)
  end

  def create_palyer(name)
    @player = Player.new(name)
  end

  def deal_cards(player, count)
    count.times do |i|
      player.add_card(@card_deck.take_card)
    end
  end

  def action_diller
  end

  def menu
    menu_arr = []
    if @player.cards.size < 3 

    else

    end
  end

  def get_name
    puts "Введите свое имя"
    name = gets.chomp
  end

  def show_money(player)
    puts "#{player.name}, на вашем счету #{player.money} монет"
  end

end
