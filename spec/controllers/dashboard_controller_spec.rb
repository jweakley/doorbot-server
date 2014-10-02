require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe 'GET index' do
    describe 'with no user signed in' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'with admin signed in' do
      render_views
      before do
        @admin = create(:admin)
        sign_in @admin
      end

      it 'shows version' do
        current_version = File.open("#{Rails.root}/VERSION",  &:readline).gsub(/[^0-9a-z.]/i, '')
        get :index
        expect(response.body).to match /Current version: #{current_version}/
      end
    end
  end

end
