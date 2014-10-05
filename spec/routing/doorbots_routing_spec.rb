require "rails_helper"

RSpec.describe DoorbotsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/doorbots").to route_to("doorbots#index")
    end

    it "routes to #new" do
      expect(:get => "/doorbots/new").to route_to("doorbots#new")
    end

    it "routes to #show" do
      expect(:get => "/doorbots/1").to route_to("doorbots#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/doorbots/1/edit").to route_to("doorbots#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/doorbots").to route_to("doorbots#create")
    end

    it "routes to #update" do
      expect(:put => "/doorbots/1").to route_to("doorbots#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/doorbots/1").to route_to("doorbots#destroy", :id => "1")
    end

  end
end
