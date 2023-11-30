# frozen_string_literal: true

class CagroTrain < Train
  def initialize(number)
    super(number, :cargo)
  end
end
