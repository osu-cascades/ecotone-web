require "rails_helper"

RSpec.describe StaticPagesController, type: :routing do
  describe "routes static pages" do

    it "routes to #home" do
      expect(get: "/").to route_to(controller: "static_pages", action: "home")
    end

  end
end
