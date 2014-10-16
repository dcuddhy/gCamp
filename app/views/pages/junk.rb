class Car

  attr_accessor :make, :model, :year

  def initialize (make, model, year)
    self.make = make
    self.model = model
    self.year = year
  end

end

car = Car.new("Chevy", Tracker", 1978)

# car.make = "Chevy"
# car.model = "Tracker"
# car.year = 1978
