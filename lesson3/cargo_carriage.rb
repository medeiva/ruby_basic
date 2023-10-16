class CagroCarriage < Carriage

  def initialize(capacity)
    @type = :cargo
    super(capacity)
  end
    
  def take_capacity(quantity)
    @occupied_capacity += quantity
  end
end
