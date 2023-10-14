class RailRoad
  
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @workWithTrain = WorkWithTrain.new
    @workWithStation = WorkWithStation.new
    @workWithRoute = WorkWithRoute.new
  end

  def menu
    loop do
      display_list([
        'хотите закрыть программу',
        'хотите создать станцию, поезд или маршрут',
        'вы хотите произвести операции с объектами',
        'хотите вывести текущие данные о объектах',
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
        puts "Вы ввели неправильное число"
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
        'хотите создать маршрут',
      ])
      choise = gets.to_i
      case choise
      when 1
        @workWithStation.create_station(@stations)
      when 2
        @workWithTrain.create_train(@trains)
      when 3
        if @workWithStation.display_stations?(@stations)
          @workWithStation.display_stations(@stations)
          @workWithRoute.create_route(@stations, @routes)
        end
      when 0
        break
      else
        puts "Вы ввели неправильное число"
      end
    end
  end

  def do_action
    loop do
      display_list([
        'вернуться в главное меню',
        'вы хотите произвести операции с поездом',
        'вы хотите произвести операции с маршрутом',
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
        puts "Вы ввели неправильное число"
      end
    end
  end

  def display_info
    if (@workWithStation.display_stations?(@stations))
      loop do
        display_list([
          'вернуться в главное меню',
          'хотите посмотреть список станций',
          'вы хотите посмотреть список поездов на станции',
        ])
        choise = gets.to_i
        if choise == 1
          @workWithStation.display_stations(@stations)
        elsif choise == 2
          @workWithStation.display_trains_on_stations(@stations) 
        elsif choise == 0
          break
        else
          puts "Вы ввели неправильное число"
        end
      end
    end
  end

  def actions_train
    if @workWithTrain.display_trains?(@trains) 
      @workWithTrain.display_trains(@trains)
      loop do
        puts "Введите порядковый номер поезда, c которым хотите совершить операцию"
        train = @trains[gets.to_i - 1]
        display_list([
          'если вернуться в главное меню',
          'хотите добавить вагон к поезду',
          'если вы хотите удалить вагон',
          'хотите переместить поезд на следующую станцию',
          'хотите переместить поезд на предыдущую станцию',
          'если хотите назначить поезду маршрут',
          'если хотите посмотерть список вагонов',
          'занять место в вагоне',
        ])
        choise = gets.to_i
        case choise
        when 1
          @workWithTrain.add_carriadge(train)
        when 2
          train.delete_carriadge
        when 3
          @workWithTrain.send_train_to_next_station(train)
        when 4
          @workWithTrain.send_train_to_prev_station(train)
        when 5
          if @workWithRoute.display_routes?(@routes)
            @workWithRoute.display_routes(@routes)
            @workWithTrain.set_route(@routes, @rain)
          end
        when 6
          @workWithTrain.show_carrige(train)
        when 7
          @workWithTrain.take_place(train)
        when 0
          break
        else
          puts "Вы ввели неправильное число"
        end
      end
    end
  end

  def actions_route
    if @workWithRoute.display_routes?(@routes)
      loop do
        puts "Введите порядковый номер маршрута, c которым хотите совершить операцию"
        route = @routes[gets.to_i]
        display_list([
          'вернуться в главное меню',
          'хотите добавить станцию к маршруту',
          'вы хотите удалить станцию из маршрута'
        ])
        choise = gets.to_i
        case choise
        when 1
          if @workWithStation.display_stations?(@stations)
            @workWithStation.display_stations(@stations)
            @workWithStation.add_station(@stations)
          end
        when 2
          @workWithStation.display_stations(route.stations)
          @workWithStation.delete_station(route)
        when 0
          break
        else
          puts "Вы ввели неправильное число"
        end
      end
    end
  end

  def display_list(items) 
    items.each_with_index{ |item, index| puts "Введите  #{index}, если #{item}."}
  end

end
