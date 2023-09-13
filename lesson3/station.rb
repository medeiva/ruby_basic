require_relative 'instance_counter_module'

class Station
  attr_reader :trains, :name

  def initialize(name)
    @@instances += 1
    @name = name
    @trains = []
    register_instance
  end

  def take_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end

  def self.instances
    @@instances
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
