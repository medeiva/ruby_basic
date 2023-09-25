class Carriage
  include CompanyName
  attr_reader :type

  def initialize(type)
    @type = type
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
