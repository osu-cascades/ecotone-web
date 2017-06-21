require 'rails_helper'

RSpec.describe BiodiversityReport, type: :model do

  subject(:report) { build :biodiversity_report, id: "FAKE" }

  context "when created" do
    it { is_expected.to have_attributes(
      date: Date.today,
      time: Date.today,
      temperature: 1.5,
      biomass_estimate: 1.5,
      species_richness: 1
    ) }
    it { is_expected.to be_valid }

    it "has a string representation incorporating its id" do
      expect(report.to_s).to eq("Biodiversity Report #{report.id}")
    end

    it "has a byline consisting of the user name, date and time" do
      expect(report.byline).to eq("by #{report.user} on #{report.date.to_s(:long)} at #{report.time.to_s(:ampm)}")
    end
  end

  describe "validations" do
    it { is_expected.to validate_numericality_of(:temperature) }
    it { is_expected.to validate_numericality_of(:biomass_estimate).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:species_richness).only_integer.is_greater_than(0) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:time) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to have_many(:plant_samples) }
    it { is_expected.to have_one(:soil_sample) }
  end

  describe "editability" do

    let(:author) { report.user }
    let(:admin) { build(:user, :admin) }

    it "is editable by its author, who is not an admin" do
      expect(report).to be_editable_by(author)
    end

    it "is editable by an admin, who is not the author" do
      expect(report).to be_editable_by(admin)
    end

    it "is not editable by anyone else" do
      expect(report).to_not be_editable_by(build(:user))
    end
  end

end
