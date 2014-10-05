require 'rails_helper'

RSpec.describe "Doorbots", :type => :request do
  describe "GET /doorbots" do
    it "works! (now write some real specs)" do
      get doorbots_path
      expect(response).to have_http_status(200)
    end
  end
end
