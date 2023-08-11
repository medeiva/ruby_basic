class Route
  attr_reader :start_station, :end_station

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @intermediate_stations = []
  end

  def add_station(station)
    @intermediate_stations << station if !@intermediate_stations.include? station
  end

  def delete_station(station)
    @intermediate_stations.delete(station)
  end

  def list_station
    route = @intermediate_stations.clone
    route.unshift(@start_station).push(@end_station)
  end
end
