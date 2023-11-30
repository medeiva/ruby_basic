# frozen_string_literal: true

require_relative 'company_module'
require_relative 'instance_counter_module'
require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'carriage'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'work_with_train'
require_relative 'work_with_route'
require_relative 'work_with_station'
require_relative 'rail_road'

puts 'Привет, это программа - абстракция железной дороги'

road = RailRoad.new
road.menu
