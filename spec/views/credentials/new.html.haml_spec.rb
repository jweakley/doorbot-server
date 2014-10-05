require 'rails_helper'

RSpec.describe "credentials/new", :type => :view do
  before(:each) do
    assign(:credential, Credential.new(
      :type => 1,
      :nickname => "MyString",
      :key => "MyString"
    ))
  end

  it "renders new credential form" do
    render

    assert_select "form[action=?][method=?]", credentials_path, "post" do

      assert_select "input#credential_type[name=?]", "credential[type]"

      assert_select "input#credential_nickname[name=?]", "credential[nickname]"

      assert_select "input#credential_key[name=?]", "credential[key]"
    end
  end
end
