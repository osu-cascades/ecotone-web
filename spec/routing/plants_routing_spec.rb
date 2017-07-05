require "rails_helper"

RSpec.describe PlantsController, type: :routing do
  describe "routes plants" do

    it "routes to #index" do
      expect(get: "/plants").to route_to(controller: "plants", action: "index")
    end

    it "routes to #new" do
      expect(get: "/plants/new").to route_to(controller: "plants", action: "new")
    end

    it "routes to #show" do
      expect(get: "/plants/1").to route_to(controller: "plants", action: "show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/plants/1/edit").to route_to(controller: "plants", action: "edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/plants").to route_to(controller: "plants", action: "create")
    end

    it "routes to #update via PUT" do
      expect(put: "/plants/1").to route_to(controller: "plants", action: "update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/plants/1").to route_to(controller: "plants", action: "update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/plants/1").to route_to(controller: "plants", action: "destroy", id: "1")
    end

  end
end
