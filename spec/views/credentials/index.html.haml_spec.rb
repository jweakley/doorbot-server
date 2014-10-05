require 'rails_helper'

RSpec.describe "credentials/index", :type => :view do
  before(:each) do
    assign(:credentials, [
      Credential.create!(
        :type => 1,
        :nickname => "Nickname",
        :key => "Key"
      ),
      Credential.create!(
        :type => 1,
        :nickname => "Nickname",
        :key => "Key"
      )
    ])
  end

  it "renders a list of credentials" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Key".to_s, :count => 2
  end
end
