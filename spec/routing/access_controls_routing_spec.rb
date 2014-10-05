require "rails_helper"

RSpec.describe AccessControlsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/access_controls").to route_to("access_controls#index")
    end

    it "routes to #new" do
      expect(:get => "/access_controls/new").to route_to("access_controls#new")
    end

    it "routes to #show" do
      expect(:get => "/access_controls/1").to route_to("access_controls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/access_controls/1/edit").to route_to("access_controls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/access_controls").to route_to("access_controls#create")
    end

    it "routes to #update" do
      expect(:put => "/access_controls/1").to route_to("access_controls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/access_controls/1").to route_to("access_controls#destroy", :id => "1")
    end

  end
end
