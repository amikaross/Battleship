require "rspec"
require './lib/game'

RSpec.describe Game do

  before(:each) do
    @game = Game.new

  end

  describe "#initialize" do
    it "exists" do
      expect(@game).to be_an_instance_of(Game)
    end
  end

  describe "#main_menu" do
    it "" do
    end
  end

  describe "#play_game" do
    it "" do

    end
  end

  describe "#player_board_setup" do
    it "" do
    end
  end

  describe "#computer_board_setup" do
    it "" do

    end
  end

  describe "#random_placement" do
    it "" do

    end
  end

  describe "#game_over?" do
    it "" do

    end
  end

  describe "#end_game" do
    it "" do

    end
  end

  describe "#winner" do
    it "" do

    end
  end

end
