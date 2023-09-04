class WorkWithRoute

  def display_routes?(routes)
    puts "Нет доступных маршрутов. Создайте новый маршрут.\n\n" unless routes.size > 0
    routes.size > 0
  end

  def display_routes(routes)
      routes.each_with_index do |route, index|
        puts "#{index}-маршрут"
        puts "#{route.stations}"
    end
  end

  def add_station(stations)
    puts "Введите номер станции, которую хотите добавить в маршрут"
    station = stations[gets.to_i]
    route.add_station(station)
  end

  def delete_station(route)
    puts "Введите номер станции, которую хотите удалить из маршрута"
    station = route.stations[gets.to_i]
    route.delete_station(station)
  end

  def create_route(stations, routes)
    if stations.size > 1
      start_station = nil
      end_station = nil
      loop do
        puts "Введите корректный номер начальной станции"
        start_station = stations[gets.to_i - 1]
        break if start_station
      end
      loop do
        puts "Введите корректный номер конечной станции"
        end_station = stations[gets.to_i - 1]
        break if end_station
      end
      puts start_station
      route = Route.new(start_station, end_station)
      routes.push(route)
    else
      puts "Создайте минимум две станции, чтобы создать маршрут.\n\n"
    end
  end

end
