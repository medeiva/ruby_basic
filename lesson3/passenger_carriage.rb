class PassengerCarriage < Carriage

  def initialize(size)
    @type = :passenger
    super(size)
  end

end

