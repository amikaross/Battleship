require 'rspec'
require './lib/ship'

RSpec.describe Ship do
# Setup for all tests (create a Ship)
  before(:each) do 
    @cruiser = Ship.new("Cruiser", 3)
  end
  describe "#initialize" do 
    it "is an instance of Ship" do
      expect(@cruiser).to be_an_instance_of(Ship)
    end

    it "has a readable name, length, and health" do 
      expect(@cruiser.name).to eq "Cruiser"
      expect(@cruiser.length).to eq 3
      expect(@cruiser.health).to eq 3
    end
  end

  describe "#hit" do 
    it "reduces the health of the ship by 1" do
      expect(@cruiser.health).to eq 3
      @cruiser.hit 
      expect(@cruiser.health).to eq 2 
      @cruiser.hit
      expect(@cruiser.health).to eq 1
    end
  end

  describe "#sunk?" do 
    it "returns true only if ship health is 0" do 
      expect(@cruiser.sunk?).to eq false
      2.times { @cruiser.hit }
      expect(@cruiser.sunk?).to eq false 
      @cruiser.hit
      expect(@cruiser.health).to eq 0
      expect(@cruiser.sunk?).to eq true 
    end
  end
end
