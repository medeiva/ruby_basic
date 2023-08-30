class Train
  attr_accessor :speed
  attr_reader :count_carriage, :type, :current_station_index, :current_station, :route, :carriages, :number

  def initialize(number)
    @number = number
    @count_carriage = count_carriage
    @speed = 0
    @carriages = []
  end

  def stop
    @speed = 0
  end

  def add_carriadge(carriage)
    @carriages.push(carriage)
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

  def current_station
    @route.stations[current_station_index]
  end

  def next_station
    @route.stations[current_station_index + 1]
  end

  def previous_station
    @route.stations[current_station_index - 1]
  end

  def go_to_next_station
    if next_station
      move_to_station(next_station) 
      @current_station_index += 1
    end
  end

  def go_to_previous_station
    if previous_station
      move_to_station(previous_station) 
      @current_station_index -= 1
    end
  end

  def delete_carriadge
    carriages.pop() if carriages.size
  end

  private

  def move_to_station(new_station)
    current_station.send_train(self)
    current_station = new_station
    current_station.take_train(self)
  end
  
end
