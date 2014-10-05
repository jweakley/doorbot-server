require 'rails_helper'

RSpec.describe "credentials/edit", :type => :view do
  before(:each) do
    @credential = assign(:credential, Credential.create!(
      :type => 1,
      :nickname => "MyString",
      :key => "MyString"
    ))
  end

  it "renders the edit credential form" do
    render

    assert_select "form[action=?][method=?]", credential_path(@credential), "post" do

      assert_select "input#credential_type[name=?]", "credential[type]"

      assert_select "input#credential_nickname[name=?]", "credential[nickname]"

      assert_select "input#credential_key[name=?]", "credential[key]"
    end
  end
end
