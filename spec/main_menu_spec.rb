require "rspec"
require "./lib/main_menu"

RSpec.describe Game do
  describe "#board_coordinates" do 
    it "returns an array of strings matching the board size specified" do
      main_menu = MainMenu.new
      expect(main_menu.board_coordinates(2, 2)).to eq(["A1", "A2", "B1", "B2"])
      expect(main_menu.board_coordinates(3, 2)).to eq(["A1", "A2", "A3", "B1", "B2", "B3"])
      expect(main_menu.board_coordinates(2, 3)).to eq(["A1", "A2", "B1", "B2", "C1", "C2"])
      expect(main_menu.board_coordinates(4, 4).length).to eq(16)
      expect(main_menu.board_coordinates(5, 4).length).to eq(20)
    end 
  end
end 