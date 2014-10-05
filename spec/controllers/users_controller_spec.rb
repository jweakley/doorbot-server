require 'rails_helper'

RSpec.describe UsersController, type: :controller, skip: true do

  describe 'GET edit' do
    describe 'with admin signed in' do
      before do
        @admin = create(:admin)
        sign_in @admin
      end

      it 'returns http success' do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET update' do
    describe 'with admin signed in' do
      before do
        @admin = create(:admin)
        sign_in @admin
      end

      it 'returns http success' do
        put :update
        expect(response).to have_http_status(:success)
      end
    end
  end

end
