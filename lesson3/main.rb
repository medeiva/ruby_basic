require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'carriage'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'rail_road'

puts "Привет, это программа - абстракция железной дороги"

road = RailRoad.new
road.menu
