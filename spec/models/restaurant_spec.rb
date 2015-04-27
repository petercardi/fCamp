require "rails_helper"

describe Restaurant do
  describe "associations" do

    xit "responds to user" do
      expect(Restaurant.new).to respond_to(:user)
    end

    xit "responds to doctor" do
      expect(Restaurant.new).to respond_to(:review)
    end

  end

end
