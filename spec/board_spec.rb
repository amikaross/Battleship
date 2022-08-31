require 'rspec'
require './lib/cell' 
require './lib/ship' #may not need this, may be accessible through the cell file

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  describe "#initialize" do
    it "is an instance of Board" do
      expect(@board).to be_an_instance_of(Board)
    end

    it "the cells attribute is a hash" do 
      expect(@board.cells).to be_a(Hash)
    end

    it "the cells attribute has 16 key/value pairs" do 
      expect(@board.cells.length).to eq 16
    end

    it "the cells attribute keys point to Cell objects" do 
      values = @board.cells.values
      values.each do |value|
        expect(value).to be_a(Cell)
      end
    end
  end

  describe "#valid_coordinate?" do #AJP
    #check to make sure the argument passed to the method 
    #is a valid coordinate on the board
  end #AJP
  
  describe "#valid_placement?" do #AJP
    #takes two arguments - ship object and array of coordinate
    #should tell us if:
      #Ship.length == coordinates.length
      #The coordinates are consecutive 
      #The coordinates are not diagonal 
      #Does not overlap with another ship
      #If all are true, then valid_placement? should be true
  end #AJP

  describe "#place" do #AMR
    #takes two arguments - ship_type and an array of coordinates
    #It should update the @cells attribute to change the @ship attribute inside of the cell
  end #AMR

  describe "#render" do #AMR
    #Similar to cell but for whole board 
    #Optional boolean argument
  end #AMR
end
