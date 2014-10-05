require 'rails_helper'

RSpec.describe "access_controls/new", :type => :view do
  before(:each) do
    assign(:access_control, AccessControl.new(
      :doorbot => nil,
      :credential => nil
    ))
  end

  it "renders new access_control form" do
    render

    assert_select "form[action=?][method=?]", access_controls_path, "post" do

      assert_select "input#access_control_doorbot_id[name=?]", "access_control[doorbot_id]"

      assert_select "input#access_control_credential_id[name=?]", "access_control[credential_id]"
    end
  end
end
