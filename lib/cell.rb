class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @ship = nil
    @coordinate = coordinate
  end

  def empty?
    if self.ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_type)
    @ship = ship_type
    self.ship

  end

  end
