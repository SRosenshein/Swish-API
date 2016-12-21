require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
    
    describe "GET #show" do
        let(:user) {create(:user)}
        
        it "returns the info about a reporter on a hash" do
            get :show, params: {id: user.id, format: :json}
            user_response = JSON.parse(response.body, symbolize_names: true)
            expect(user_response[:email]).to eql(user.email)
        end
        
        it "returns http success" do
            get :show, params: {id: user.id, format: :json}
            expect(response).to have_http_status(:success)
        end
    end

end
