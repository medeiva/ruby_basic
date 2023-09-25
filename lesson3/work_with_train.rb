class WorkWithTrain 
  
  def display_trains?(trains)
    puts "Нет доступных поездов. Создайте новый поезд.\n\n" unless trains.size > 0
    trains.size > 0
  end

  def display_trains(trains)
    trains.each_with_index do |train, index|
      puts "#{index}-поезд № #{train.number}"
    end
  end

  def add_carriadge(train)
    carriage = create_carrige(train)
    train.add_carriadge(carriage)
  end

  def send_train_to_next_station(train)
    if train.route 
      train.go_to_next_station
    else
      puts "Нет маршрута. Задайте маршрут"
    end
  end

  def send_train_to_next_station(train)
    if train.route 
      train.go_to_previous_station
    else
      puts "Нет маршрута. Задайте маршрут"
    end
  end

  def set_route(routes, train)
    puts "Введите порядковый номер маршрута, c которым хотите совершить операцию"
    route = routes[gets.to_i]
    train.set_route(route)
  end

  def create_train(trains)
      puts "Введите 1, если поезд грузовой \n Введите 2, если поезд пассажирский"
      type = gets.to_i
      puts "Введите номер поезда"
      number = gets.chomp.to_s
      train = if type == 1
                CagroTrain.new(number)
              elsif type == 2
                PassengerTrain.new(number)
              end
      trains.push(train)
      puts "Поезд #{number} создан"
      rescue StandardError => e
        puts "Ошибка создания поезда: #{e.message}"
        retry
  end

  private 

  def create_carrige(train)
    if train.type == :passenger
        PassengerCarriage.new()
    elsif train.type == :cargo
        CagroCarriage.new()
    end
  end
end
