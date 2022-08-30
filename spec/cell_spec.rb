require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do 
# Setup for all tests (create a ship and cell)
  before(:each) do 
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1 = Cell.new("B4")
  end

  describe "#initialize" do 
    it "is an instance of Cell" do 
      expect(@cell_1).to be_an_instance_of(Cell)
    end

    it "has readable coordinate and ship attributes" do 
      expect(@cell_1.coordinate).to eq "B4"
      expect(@cell_1.ship).to eq nil 
    end
  end

  describe "#empty?" do 
    it "starts out empty by default" do 
      expect(@cell_1.ship).to eq nil 
      expect(@cell_1.empty?).to eq true 
    end

    it "returns false when a ship is on cell" do 
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.empty?).to eq false 
    end
  end

  describe "#place_ship" do 
    it "updates the ship attribute correctly when called" do 
      expect(@cell_1.ship).to eq nil 
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.ship).to eq @cruiser 
    end
  end 

  describe "#fire_upon" do 
    it "reduces ship health by 1" do 
      @cell_1.place_ship(@cruiser)
      expect(@cell_1.ship.health).to eq 3 
      @cell_1.fire_upon
      expect(@cell_1.ship.health).to eq 2 
    end
  end

  describe "#fired_upon?" do 
    it "knows when its been fired upon when a ship is present" do 
      @cell_1.place_ship(@cruiser)
      expect(@cell.fired_upon?).to eq false
      @cell_1.fire_upon 
      expect(@cell_1.fired_upon?).to eq true 
    end

    it "knows when a ship is not present"
    expect(@cell_1.fired_upon?).to eq false
    @cell_1.fire_upon 
    expect(@cell_1.fired_upon?).to eq true 
  end

  describe "#render" do 

  end

end