require 'rails_helper'

RSpec.describe "doorbots/show", :type => :view do
  before(:each) do
    @doorbot = assign(:doorbot, Doorbot.create!(
      :nickname => "Nickname",
      :api_key => "Api Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(/Api Key/)
  end
end
