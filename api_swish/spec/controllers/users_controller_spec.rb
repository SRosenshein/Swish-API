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
    
    describe "POST #create" do
        context "when is successfully created" do
            it "renders the json representation for the user record" do
                @user_atts = attributes_for(:user)
                post :create, params: {user: @user_atts, format: :json}
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response[:email]).to eql(@user_atts[:email])
            end
            
            it "returns http success (201)" do
                @user_atts = attributes_for(:user)
                post :create, params: {user: @user_atts, format: :json}
                expect(response).to have_http_status(201)
            end
        end
        
        context "when is not successfully created" do
            # no email 
            let(:inv_user) do 
                {
                    password: "helloworld", 
                    password_confirmation: "helloworld"
                }
            end
                
            it "renders an errors json" do
                post :create, params: {user: inv_user, format: :json}
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response).to have_key(:errors)
            end
            
            it "renders the json errors on why the user could not be created" do
                post :create, params: {user: inv_user, format: :json}
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response[:errors][:email]).to include "can't be blank"
            end
            
            it "returns http status 422" do
                post :create, params: {user: inv_user, format: :json}
                expect(response).to have_http_status(422)
            end
        end
    end
    
    describe "PUT/PATCH #update" do
        context "when is successfully updated" do
            before(:each) do
                @user = create(:user)
                put :update, params: {id: @user.id, user: {email: "new@example.com"}, format: :json}
            end
            
            it "renders the json representation for the updated user" do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response[:email]).to eql("new@example.com")
            end
            
            it {should respond_with 200}
        end
        
        context "when is not created" do
            before(:each) do
                @user = create(:user)
                put :update, params: {id: @user.id, user: {email: "bad.com"}, format: :json}
            end
            
            it "renders an errors json" do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response).to have_key(:errors)
            end
            
            it "renders the json errors" do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response[:errors][:email]).to include "is not an email"
            end
            
            it {should respond_with 422}
        end
    end
end
