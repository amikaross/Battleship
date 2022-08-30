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
end

  describe "#empty?" do 
    it "starts out empty by default" do 
      expect(@cell.ship).to eq nil 
      expect(@cell.empty?).to eq true 
    end

    it "returns false when ship is on cell" do 
      @cell.place_ship(@cruiser)
      expect(@cell.empty?).to eq false 
    end
  end
end