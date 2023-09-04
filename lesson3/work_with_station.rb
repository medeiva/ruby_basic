class WorkWithStation

  def display_stations?(stations)
    puts "Нет доступных станций. Создайте новую станцию.\n\n" unless stations.size > 0
    stations.size > 0
  end

  def display_stations(stations) 
    stations.each_with_index do |station, index|
      puts "#{index}-станция #{station.name}"
    end
  end

  def display_trains_on_stations(stations) 
    display_stations(stations)
    puts "Введите номер станции, список поездов на которой хотите посмотреть"
    station = stations[gets.to_i]

    if station
      station.trains.each do |train|
        puts "Номер: #{train.number}"
        puts "Тип поезда - #{train.type}"
        puts "Кол-во вагонов - #{train.carriages.size}"
        train.each_index do |carriage, index|
          puts "#{index} - тип вагона #{carriage.type}"
        end
      end
    else
      puts "Вы ввели неправильное номер станции"
    end
  
  end

  def create_station(stations)
    puts "Введите название станции"
    name = gets.chomp
    stations.push(Station.new(name))
  end

end
