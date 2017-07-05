require "rails_helper"

RSpec.describe SessionsController, type: :routing do
  describe "routes sessions" do

    it "routes to #new" do
      expect(get: "/login").to route_to(controller: "sessions", action: "new")
    end

    it "routes to #create" do
      expect(post: "/login").to route_to(controller: "sessions", action: "create")
    end

    it "routes to #destroy" do
      expect(delete: "/logout").to route_to(controller: "sessions", action: "destroy")
    end

  end
end
