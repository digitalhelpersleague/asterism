require "rails_helper"

RSpec.describe SipsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sips").to route_to("sips#index")
    end

    it "routes to #show" do
      expect(:get => "/sips/1").to route_to("sips#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sips").to route_to("sips#create")
    end

    it "routes to #update" do
      expect(:put => "/sips/1").to route_to("sips#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sips/1").to route_to("sips#destroy", :id => "1")
    end

  end
end
