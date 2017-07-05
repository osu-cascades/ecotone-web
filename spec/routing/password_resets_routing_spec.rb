require "rails_helper"

RSpec.describe PasswordResetsController, type: :routing do
  describe "routes sessions" do

    it "routes to #new" do
      expect(get: "/password_resets/new").to route_to(controller: "password_resets", action: "new")
    end

    it "routes to #create" do
      expect(post: "/password_resets").to route_to(controller: "password_resets", action: "create")
    end

    it "routes to #edit" do
      expect(get: "/password_resets/1/edit").to route_to(controller: "password_resets", action: "edit", id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/password_resets/1").to route_to(controller: "password_resets", action: "update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/password_resets/1").to route_to(controller: "password_resets", action: "update", id: "1")
    end

  end
end
