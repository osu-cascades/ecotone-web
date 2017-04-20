require "rails_helper"

RSpec.describe PlotsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/plots").to route_to("plots#index")
    end

    it "routes to #new" do
      expect(:get => "/plots/new").to route_to("plots#new")
    end

    it "routes to #show" do
      expect(:get => "/plots/1").to route_to("plots#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/plots/1/edit").to route_to("plots#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/plots").to route_to("plots#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/plots/1").to route_to("plots#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/plots/1").to route_to("plots#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/plots/1").to route_to("plots#destroy", :id => "1")
    end

  end
end
