# frozen_string_literal: true

class WorkWithTrain
  def display_trains?(trains)
    puts "Нет доступных поездов. Создайте новый поезд.\n\n" unless trains.size.positive?
    trains.size.positive?
  end

  def display_trains(trains)
    trains.each_with_index do |train, index|
      puts "#{index}-поезд № #{train.number}"
    end
  end

  def add_carriadge(train)
    puts 'Введите вместимость вагона'
    size = gets.to_i
    carriage = create_carrige(train, size)
    train.add_carriadge(carriage)
  end

  def send_train_to_next_station(train)
    if train.route
      train.go_to_next_station
    else
      puts 'Нет маршрута. Задайте маршрут'
    end
  end

  def set_route(routes, train)
    puts 'Введите порядковый номер маршрута, c которым хотите совершить операцию'
    route = routes[gets.to_i]
    train.set_route(route)
  end

  def create_train(trains)
    puts "Введите 1, если поезд грузовой \n Введите 2, если поезд пассажирский"
    type = gets.to_i
    puts 'Введите номер поезда'
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

  def show_carrige(train)
    train.each_carriage do |carriage, index|
      puts "Номер вагона - #{index}, тип вагона - #{carriage.type}, вместимость - #{carriage.capacity}, кол-во #{carriage.type == :passenger ? ' занятых мест' : 'занятого обьема'} - #{carriage.occupied_capacity}, кол-во #{carriage.type == :passenger ? 'свободных мест' : 'свободного обьема'} - #{carriage.free_capacity}"
    end
  end

  def take_capacity(train)
    show_carrige(train)
    puts 'Введите номер вагона, c которым хотите совершить операцию'
    carriage = train.carriages[gets.to_i - 1]
    if carriage.type == :cargo
      puts 'Введите кол-во занимаего места'
      quantity = gets.to_i
    else
      quantity = 1
    end
    if carriage.free_capacity - quantity >= 0
      carriage.type == :cargo ? carriage.take_capacity(quantity) : carriage.take_capacity
    else
      puts "Невозможно занять столько места. Свободных мест #{carriage.free_capacity}"
    end
  end

  private

  def create_carrige(train, size)
    if train.type == :passenger
      PassengerCarriage.new(size)
    elsif train.type == :cargo
      CagroCarriage.new(size)
    end
  end
end
