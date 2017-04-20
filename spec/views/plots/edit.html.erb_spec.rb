require 'rails_helper'

RSpec.describe "plots/edit", type: :view do
  before(:each) do
    @plot = assign(:plot, Plot.create!(
      :plot_id => 1,
      :latitude => 1.5,
      :longitude => 1.5,
      :elevation => 1.5,
      :area => 1.5,
      :location_description => "MyText",
      :aspect => "MyString",
      :origin => "MyString",
      :inoculated => false,
      :initial_planting_date => "MyString",
      :initial_succession => "MyString",
      :photo => "MyString"
    ))
  end

  it "renders the edit plot form" do
    render

    assert_select "form[action=?][method=?]", plot_path(@plot), "post" do

      assert_select "input#plot_plot_id[name=?]", "plot[plot_id]"

      assert_select "input#plot_latitude[name=?]", "plot[latitude]"

      assert_select "input#plot_longitude[name=?]", "plot[longitude]"

      assert_select "input#plot_elevation[name=?]", "plot[elevation]"

      assert_select "input#plot_area[name=?]", "plot[area]"

      assert_select "textarea#plot_location_description[name=?]", "plot[location_description]"

      assert_select "input#plot_aspect[name=?]", "plot[aspect]"

      assert_select "input#plot_origin[name=?]", "plot[origin]"

      assert_select "input#plot_inoculated[name=?]", "plot[inoculated]"

      assert_select "input#plot_initial_planting_date[name=?]", "plot[initial_planting_date]"

      assert_select "input#plot_initial_succession[name=?]", "plot[initial_succession]"

      assert_select "input#plot_photo[name=?]", "plot[photo]"
    end
  end
end
