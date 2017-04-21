require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe "#full_title" do

    it "returns the base title without arguments" do
      expect(helper.full_title).to eq("Ecotone | OSU Cascades")
    end

    it "returns a full title" do
      expect(helper.full_title("TEST")).to eq("TEST | Ecotone | OSU Cascades")
    end

  end

end
