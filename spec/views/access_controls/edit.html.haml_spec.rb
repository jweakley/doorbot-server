require 'rails_helper'

RSpec.describe "access_controls/edit", :type => :view do
  before(:each) do
    @access_control = assign(:access_control, AccessControl.create!(
      :doorbot => nil,
      :credential => nil
    ))
  end

  it "renders the edit access_control form" do
    render

    assert_select "form[action=?][method=?]", access_control_path(@access_control), "post" do

      assert_select "input#access_control_doorbot_id[name=?]", "access_control[doorbot_id]"

      assert_select "input#access_control_credential_id[name=?]", "access_control[credential_id]"
    end
  end
end
