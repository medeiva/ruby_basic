class CagroCarriage < Carriage

  def initialize(size)
    @type = :cargo
    super(size)
  end
  
end
