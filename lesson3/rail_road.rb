# frozen_string_literal: true

class RailRoad
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @work_with_train = WorkWithTrain.new
    @work_with_station = WorkWithStation.new
    @work_with_route = WorkWithRoute.new
  end

  def menu
    loop do
      display_list([
                     'хотите закрыть программу',
                     'хотите создать станцию, поезд или маршрут',
                     'вы хотите произвести операции с объектами',
                     'хотите вывести текущие данные о объектах'
                   ])
      choise = gets.to_i
      case choise
      when 1
        create
      when 2
        do_action
      when 3
        display_info
      when 0
        break
      else
        puts 'Вы ввели неправильное число'
      end
    end
  end

  private

  def create
    loop do
      display_list([
                     'вернуться в главное меню',
                     'хотите создать станцию',
                     'вы хотите создать поезд',
                     'хотите создать маршрут'
                   ])
      choise = gets.to_i
      case choise
      when 1
        @work_with_station.create_station(@stations)
      when 2
        @work_with_train.create_train(@trains)
      when 3
        if @work_with_station.display_stations?(@stations)
          @work_with_station.display_stations(@stations)
          @work_with_route.create_route(@stations, @routes)
        end
      when 0
        break
      else
        puts 'Вы ввели неправильное число'
      end
    end
  end

  def do_action
    loop do
      display_list([
                     'вернуться в главное меню',
                     'вы хотите произвести операции с поездом',
                     'вы хотите произвести операции с маршрутом'
                   ])
      choise = gets.to_i
      case choise
      when 1
        actions_train
      when 2
        actions_route
      when 0
        break
      else
        puts 'Вы ввели неправильное число'
      end
    end
  end

  def display_info
    return unless @work_with_station.display_stations?(@stations)

    loop do
      display_list([
                     'вернуться в главное меню',
                     'хотите посмотреть список станций',
                     'вы хотите посмотреть список поездов на станции'
                   ])
      choise = gets.to_i
      case choise
      when 1
        @work_with_station.display_stations(@stations)
      when 2
        @work_with_station.display_trains_on_stations(@stations)
      when 0
        break
      else
        puts 'Вы ввели неправильное число'
      end
    end
  end

  def actions_train
    return unless @work_with_train.display_trains?(@trains)

    @work_with_train.display_trains(@trains)
    loop do
      puts 'Введите порядковый номер поезда, c которым хотите совершить операцию'
      train = @trains[gets.to_i - 1]
      display_list([
                     'если вернуться в главное меню',
                     'хотите добавить вагон к поезду',
                     'если вы хотите удалить вагон',
                     'хотите переместить поезд на следующую станцию',
                     'хотите переместить поезд на предыдущую станцию',
                     'если хотите назначить поезду маршрут',
                     'если хотите посмотерть список вагонов',
                     'занять место в вагоне'
                   ])
      choise = gets.to_i
      case choise
      when 1
        @work_with_train.add_carriadge(train)
      when 2
        train.delete_carriadge
      when 3
        @work_with_train.send_train_to_next_station(train)
      when 4
        @work_with_train.send_train_to_prev_station(train)
      when 5
        if @work_with_route.display_routes?(@routes)
          @work_with_route.display_routes(@routes)
          @work_with_train.set_route(@routes, @rain)
        end
      when 6
        @work_with_train.show_carrige(train)
      when 7
        @work_with_train.take_capacity(train)
      when 0
        break
      else
        puts 'Вы ввели неправильное число'
      end
    end
  end

  def actions_route
    return unless @work_with_route.display_routes?(@routes)

    loop do
      puts 'Введите порядковый номер маршрута, c которым хотите совершить операцию'
      route = @routes[gets.to_i]
      display_list([
                     'вернуться в главное меню',
                     'хотите добавить станцию к маршруту',
                     'вы хотите удалить станцию из маршрута'
                   ])
      choise = gets.to_i
      case choise
      when 1
        if @work_with_station.display_stations?(@stations)
          @work_with_station.display_stations(@stations)
          @work_with_station.add_station(@stations)
        end
      when 2
        @work_with_station.display_stations(route.stations)
        @work_with_station.delete_station(route)
      when 0
        break
      else
        puts 'Вы ввели неправильное число'
      end
    end
  end

  def display_list(items)
    items.each_with_index { |item, index| puts "Введите  #{index}, если #{item}." }
  end
end
