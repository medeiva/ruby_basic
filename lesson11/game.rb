class Game
  BET = 10

  def initialize
    @card_deck = CardDeck.new
  end

  def create
    puts "Добро пожаловать в игру 21"
    create_palyers
    start
  end
  
  private

  def create_palyers
    create_diller
    create_user
  end

  def create_user
    @user = create_palyer(get_name)
    puts @user
  end

  def new_game
    show_money(@user)
    puts "Хотите сыграть еще? Введите 1. Для выхода из игры что угодно"
    choise = gets.to_i
    if choise == 1
      clean
      start
    else 
      exit
    end
  end

  def start
    show_money(@user)
    puts "Ваши карты: "
    deal_cards(@user, 2)
    @user.show_card
    deal_cards(@diller, 2)
    place_bet
    show_menu
  end

  def clean
    @user.cards = []
    @diller.cards = []
    @card_deck = CardDeck.new
  end

  def create_diller
    @diller = create_palyer('diller')
  end

  def create_palyer(name)
    Player.new(name)
  end

  def deal_cards(player, count)
    count.times do |i|
      player.add_card(@card_deck.take_card)
    end
  end

  def show_menu
    str_options = ["Выйти из игры" ,"Пропустить", "Открыть карты"]
    int_options = [0, 1, 2]

    if @user.cards.size < 3 
      str_options.push("Добавить карту")
      int_options.push(3)
    end

    display_list(str_options)
    loop do
      choise = gets.to_i
      case choise
        when 1
          scip(@user)
        when 2
          open_card
        when 3
          deal_cards(@user, 1)
          puts @user.cards[2].view
          actions_diller
        when 0
          break
        else
          puts 'Вы ввели неправильное число'
        end
    end
  end

  def bankrupt?
    @user.money < 1
  end

  def get_name
    puts "Введите свое имя"
    name = gets.chomp
  end

  def show_money(player)
    puts "#{player.name}, на вашем счету #{player.money} монет"
  end

  def display_list(items)
    items.each_with_index { |item, index| puts "Введите  #{index}, если хотите #{item}." }
  end

  def scip(player)
    if player == @user 
      actions_diller
    else
      show_menu
    end
  end

  def actions_diller
      if @diller.points > 16 || @diller.cards.size > 2 
        scip(@diller)
      else
        deal_cards(@diller, 1)
        show_menu
      end
  end

  def open_card
    open_card_player(@user, "Ваши")
    open_card_player(@diller, "Диллера")
    check_winner
  end

  def open_card_player(player, str)
    puts "----------------------------"
    puts "#{str} карты:"
    player.show_card
    puts "Очки: #{str} #{player.points} "
  end

  def check_winner
    @winner = nil
    if @user.points < 22 && @diller.points < 22
      unless @user.points == @diller.points
        @winner = @user.points > @diller.points ? @user : @diller
      end
    else 
      @winner = @user.points < 22 ? @user : @diller
    end
    show_winner
    if bankrupt?
      puts "----------------------------"
      puts "Азартные игры не ваше! Прощайте." 
      exit
    else 
      new_game
    end
  end

  def show_winner
    puts "----------------------------"
    if @winner
       @winner.money += @bank
       puts "Победил #{@winner.name}"
    else 
      puts "Ничья"
    end
  end

  def place_bet
    @user.put_bank(BET)
    @diller.put_bank(BET)
    @bank = BET + BET
  end

end
