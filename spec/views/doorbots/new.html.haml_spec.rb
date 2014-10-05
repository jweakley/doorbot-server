require 'rails_helper'

RSpec.describe "doorbots/new", :type => :view do
  before(:each) do
    assign(:doorbot, Doorbot.new(
      :nickname => "MyString",
      :api_key => "MyString"
    ))
  end

  it "renders new doorbot form" do
    render

    assert_select "form[action=?][method=?]", doorbots_path, "post" do

      assert_select "input#doorbot_nickname[name=?]", "doorbot[nickname]"

      assert_select "input#doorbot_api_key[name=?]", "doorbot[api_key]"
    end
  end
end
