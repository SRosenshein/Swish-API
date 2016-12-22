require 'rails_helper'

RSpec.describe User, type: :model do
    before {@user = create(:user)}
    
    #tests for email
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_uniqueness_of(:email)}
    it {is_expected.to allow_value("user@swish.com").for(:email)}
    
    #tests for password
    it {is_expected.to validate_presence_of(:password)}
    
    it {should respond_to(:auth_token)}
    
    describe "attributes" do
        it "has email, password, password_confirmation attributes" do
            expect(@user).to have_attributes(email: @user.email, password: @user.password, password_confirmation: @user.password_confirmation)
        end
    end
end