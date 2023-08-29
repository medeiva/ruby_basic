class Train
  attr_accessor :speed
  attr_reader :count_carriage, :type, :current_station_index, :current_station, :route

  def initialize(number, type, count_carriage)
    @number = number
    @type = type
    @count_carriage = count_carriage
    @speed = 0
  end

  def stop
    @speed = 0
  end

  def add_carriadge
    @count_carriage += 1 if @speed == 0
  end

  def remove_carriadge
    @count_carriage -= 1 if @speed == 0
  end

  def assigne_route(route)
    @route = route
    @current_station_index = 0
    @current_station = @route.stations.first
    @current_station.take_train(self)
  end

  def next_station
    @route.stations[current_station_index + 1]
  end

  def prev_station
    @route.stations[current_station_index - 1]
  end

  def go_to_next_station
    move_to_station(next_station, current_station_index + 1) if current_station != @route.stations.last
  end

  def go_to_prev_station
    move_to_station(prev_station, current_station_index - 1) if current_station != @route.stations.first
  end

  def move_to_station(new_station, index)
    @current_station_index = index
    @current_station.send_train(self)
    @current_station = new_station
    @current_station.take_train(self)
  end

  def index_station
    @route.stations.index(self.station)
  end
end
