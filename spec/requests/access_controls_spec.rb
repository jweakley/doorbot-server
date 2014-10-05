require 'rails_helper'

RSpec.describe "AccessControls", :type => :request do
  describe "GET /access_controls" do
    it "works! (now write some real specs)" do
      get access_controls_path
      expect(response).to have_http_status(200)
    end
  end
end
