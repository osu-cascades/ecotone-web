require 'rails_helper'

RSpec.describe "plots/index", type: :view do
  before(:each) do
    assign(:plots, [
      Plot.create!(
        :plot_id => 2,
        :latitude => 3.5,
        :longitude => 4.5,
        :elevation => 5.5,
        :area => 6.5,
        :location_description => "MyText",
        :aspect => "Aspect",
        :origin => "Origin",
        :inoculated => false,
        :initial_planting_date => "Initial Planting Date",
        :initial_succession => "Initial Succession",
        :photo => "Photo"
      ),
      Plot.create!(
        :plot_id => 2,
        :latitude => 3.5,
        :longitude => 4.5,
        :elevation => 5.5,
        :area => 6.5,
        :location_description => "MyText",
        :aspect => "Aspect",
        :origin => "Origin",
        :inoculated => false,
        :initial_planting_date => "Initial Planting Date",
        :initial_succession => "Initial Succession",
        :photo => "Photo"
      )
    ])
  end

  it "renders a list of plots" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
    assert_select "tr>td", :text => 6.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Aspect".to_s, :count => 2
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Initial Planting Date".to_s, :count => 2
    assert_select "tr>td", :text => "Initial Succession".to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
  end
end
