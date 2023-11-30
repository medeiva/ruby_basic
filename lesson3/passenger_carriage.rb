# frozen_string_literal: true

class PassengerCarriage < Carriage
  def initialize(capacity)
    @type = :passenger
    super(capacity)
  end

  def take_capacity
    @occupied_capacity += 1
  end
end
