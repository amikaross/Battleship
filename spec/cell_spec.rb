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
    xit "is an instance of Cell" do 
      expect(@cell).to be_an_instance_of(Cell)
    end

    xit "has readable coordinate and ship attributes" do 
      expect(@cell.coordinate).to eq "B4"
      expect(@cell.ship).to eq nil 
    end
  end

  describe "#empty?" do 
    xit "starts out empty by default" do 
      expect(@cell.ship).to eq nil 
      expect(@cell.empty?).to eq true 
    end

    xit "returns false when ship is on cell" do 
      @cell.place_ship(@cruiser)
      expect(@cell.empty?).to eq false 
    end
  end

  describe "#place_ship" do 
    xit "updates the ship attribute correctly when called" do 
      expect(@cell.ship).to eq nil 
      @cell.place_ship(@cruiser)
      expect(@cell.ship).to eq @cruiser 
    end
  end 
end