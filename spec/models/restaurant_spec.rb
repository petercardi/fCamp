require "rails_helper"

xdescribe Restaurant do
  describe "associations" do

    it "responds to user" do
      expect(Restaurant.new).to respond_to(:user)
    end

    it "responds to doctor" do
      expect(Restaurant.new).to respond_to(:review)
    end

  end
end
