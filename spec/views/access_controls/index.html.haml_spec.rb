require 'rails_helper'

RSpec.describe "access_controls/index", :type => :view do
  before(:each) do
    assign(:access_controls, [
      AccessControl.create!(
        :doorbot => nil,
        :credential => nil
      ),
      AccessControl.create!(
        :doorbot => nil,
        :credential => nil
      )
    ])
  end

  it "renders a list of access_controls" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
