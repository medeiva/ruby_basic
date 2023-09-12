require_relative 'instance_counter_module'

class Route
  attr_accessor :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    register_instance
  end
  
  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station) if delete_station?(station)
  end

  def show_list_stations
    stations.each do |station|  
      puts station.name
    end 
  end

  private 

  def delete_station?(station)
    stations.include?(station) && stations.last != station && stations.first != station 
  end

end
