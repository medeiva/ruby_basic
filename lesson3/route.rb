class Route
  attr_accessor :stations

  def initialize(start_station, end_station)
    self.stations = [start_station, end_station]
  end
  
  def add_station(station)
    self.stations.insert(-2, station)
  end

  def delete_station(station)
    self.stations.delete(station) if delete_station?(station)
  end

  def show_list_stations
    self.stations.each do |station|  
      puts station.name
    end 
  end

  private 

  def delete_station?(station)
    self.stations.include?(station) && self.stations.last != station && self.stations.first != station 
  end

end
