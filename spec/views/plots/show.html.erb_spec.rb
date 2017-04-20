require 'rails_helper'

RSpec.describe "plots/show", type: :view do
  before(:each) do
    @plot = assign(:plot, Plot.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5.5/)
    expect(rendered).to match(/6.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Aspect/)
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Initial Planting Date/)
    expect(rendered).to match(/Initial Succession/)
    expect(rendered).to match(/Photo/)
  end
end
