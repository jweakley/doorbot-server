require 'rails_helper'

RSpec.describe "doorbots/index", :type => :view do
  before(:each) do
    assign(:doorbots, [
      Doorbot.create!(
        :nickname => "Nickname",
        :api_key => "Api Key"
      ),
      Doorbot.create!(
        :nickname => "Nickname",
        :api_key => "Api Key"
      )
    ])
  end

  it "renders a list of doorbots" do
    render
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Api Key".to_s, :count => 2
  end
end
