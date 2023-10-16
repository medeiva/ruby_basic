class Carriage
  include CompanyName
  attr_accessor :occupied_capacity
  attr_reader :type, :capacity
  
  def initialize(capacity)
    @capacity = capacity
    @occupied_capacity = 0
    validate!
  end
  
  def valid?
    validate!
  rescue
    false
  end

  def free_capacity
    capacity - occupied_capacity
  end

  protected

  def validate!
    raise "Type can't be nill" if type.nil?
    true
  end

end
