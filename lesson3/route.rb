require_relative 'instance_counter_module'

class Route
  include InstanceCounter
  attr_accessor :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
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

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Start station has invalid format" if @stations.first.class != Station
    raise "End station has invalid format" if @stations.last.class != Station
  end

  private 

  def delete_station?(station)
    stations.include?(station) && stations.last != station && stations.first != station 
  end

end
