require 'rails_helper'

RSpec.describe "Api::V1::Users::SignUps", type: :request do
  describe "Create user" do
    context 'with valid params' do
     
      it "creates a new user" do
        user = {
          username: "username",
          email: "test@test.com",
          password: "password",
        }
        expect { post "/api/v1/users/sign_up", params: user }.to change(User, :count).by(+1)
        expect(response).to have_http_status :created
      end

      it "should not create a new user" do
        user = {}
        post "/api/v1/users/sign_up", params: user
        expect(response).to have_http_status :unprocessable_entity
      end

    end
    
  end
end
