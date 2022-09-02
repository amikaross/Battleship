require 'rspec'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @player_board = Board.new
    @computer_board = Board.new
    @turn = Turn.new(@player_board, @computer_board)
  end

  describe "#initialize" do
    it "exists" do
      expect(@turn).to be_an_instance_of(Turn)
    end
  end

  describe "#player_shot" do
    it "Should update the cell object with correct fired upon status" do

    end
  end

  describe "#computer_shot" do
    it "Should update the cell object with correct fired upon status" do

    end
  end

  # describe "#results" do
  #   it "" do
  #     #terminal output, may not be able to test
  #   end
  # end
end
