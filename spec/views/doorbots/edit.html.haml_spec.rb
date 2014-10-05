require 'rails_helper'

RSpec.describe "doorbots/edit", :type => :view do
  before(:each) do
    @doorbot = assign(:doorbot, Doorbot.create!(
      :nickname => "MyString",
      :api_key => "MyString"
    ))
  end

  it "renders the edit doorbot form" do
    render

    assert_select "form[action=?][method=?]", doorbot_path(@doorbot), "post" do

      assert_select "input#doorbot_nickname[name=?]", "doorbot[nickname]"

      assert_select "input#doorbot_api_key[name=?]", "doorbot[api_key]"
    end
  end
end
