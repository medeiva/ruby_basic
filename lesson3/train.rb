class Train
  attr_accessor :speed
  attr_reader :count_carriage, :type, :station

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

  def put_route(route)
    @route = route
    @station =  @route.start_station
    @station.take_train(self)
  end

  def next_station
    @route.list_station[index_station+1]
  end

  def prev_station
    @route.list_station[index_station-1]
  end

  def go_to_next_station
    move_to_station(next_station) if @station != @route.end_station
  end

  def go_to_prev_station
    move_to_station(prev_station) if @station != @route.start_station
  end

  def move_to_station(new_station)
      @station.send_train(self)
      @station = new_station
      @station.take_train(self)
  end

  def index_station
    @route.list_station.index(@station)
  end
end
