class Carriage
  include CompanyName
  attr_reader :type, :size, :occupied_size
  
  def initialize(size)
    @size = size
    @occupied_size = 0
    validate!
  end
  
  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Type can't be nill" if type.nil?
    true
  end

end
