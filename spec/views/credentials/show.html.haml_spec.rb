require 'rails_helper'

RSpec.describe "credentials/show", :type => :view do
  before(:each) do
    @credential = assign(:credential, Credential.create!(
      :type => 1,
      :nickname => "Nickname",
      :key => "Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(/Key/)
  end
end
