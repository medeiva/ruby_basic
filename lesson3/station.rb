class Station
  attr_reader :trains, :name
  @@instances = 0

  def initialize(name)
    @@instances += 1
    @name = name
    @trains = []
    validate!
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

  def valid?
    validate!
  rescue
    false
  end

  def each_train(&block)
    trains.each(&block)
  end

  protected

  def validate!
    raise "name can't be nill" if name.nil?
  end
end
