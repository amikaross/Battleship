require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do 
# Setup of all tests (create a ship and cell)
  before(:each) do 
    @cruiser = Ship.new("Cruiser", 3)
    @cell = Cell.new("B4")
  end

  describe "#initialize" do 
    it "is an instance of Cell" do 
      expect(@cell).to be_an_instance_of(Cell)
    end

    it "has readable coordinate and ship attributes" do 
      expect(@cell.coordinate).to eq "B4"
      expect(@cell.ship).to eq nil 
    end
  end

  describe "#empty?" do 
    it "starts out empty by default" do 
      expect(@cell.ship).to eq nil 
      expect(@cell.empty?).to eq true 
    end

    it "returns false when a ship is on cell" do 
      @cell.place_ship(@cruiser)
      expect(@cell.empty?).to eq false 
    end
  end

  describe "#place_ship" do 
    it "updates the ship attribute correctly when called" do 
      expect(@cell.ship).to eq nil 
      @cell.place_ship(@cruiser)
      expect(@cell.ship).to eq @cruiser 
    end
  end 

  describe "#fire_upon" do 
    it "reduces ship health by 1" do 
      @cell.place_ship(@cruiser)
      expect(@cell.ship.health).to eq 3 
      @cell.fired_upon
      expect(@cell.ship.health).to eq 2 
    end
  end

  describe "#fired_upon?" do 
    it "knows when its been fired upon" do 
      @cell.place_ship(@cruiser)
      expect(@cell.fired_upon?).to eq false
      @cell.fire_upon 
      expect(@cell.fired_upon?).to eq true 
    end
  end

end