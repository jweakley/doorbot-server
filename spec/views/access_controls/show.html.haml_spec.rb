require 'rails_helper'

RSpec.describe "access_controls/show", :type => :view do
  before(:each) do
    @access_control = assign(:access_control, AccessControl.create!(
      :doorbot => nil,
      :credential => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
