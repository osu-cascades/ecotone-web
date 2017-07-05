require "rails_helper"

RSpec.describe PlotsController, type: :routing do
  describe "routes plots" do

    it "routes to #index" do
      expect(get: "/plots").to route_to(controller: "plots", action: "index")
    end

    it "routes to #new" do
      expect(get: "/plots/new").to route_to(controller: "plots", action: "new")
    end

    it "routes to #show" do
      expect(get: "/plots/1").to route_to(controller: "plots", action: "show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/plots/1/edit").to route_to(controller: "plots", action: "edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/plots").to route_to(controller: "plots", action: "create")
    end

    it "routes to #update via PUT" do
      expect(put: "/plots/1").to route_to(controller: "plots", action: "update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/plots/1").to route_to(controller: "plots", action: "update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/plots/1").to route_to(controller: "plots", action: "destroy", id: "1")
    end

  end
end
