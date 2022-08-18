require 'rails_helper'

RSpec.describe "Api::V1::Users::SignIns", type: :request do
  describe "User authentication" do
    before do
      @user = User.new(username: "test", email: "test@test.com", password: "password").save
    end
    context 'with valid params' do
     
      it "authentication sucess" do
        user = {
          email: "test@test.com",
          password: "password",
        }
        post "/api/v1/users/sign_in", params: user
        expect(response).to have_http_status :ok
      end

      it "authentication fail" do
        user = {
          email: "test1@test.com",
          password: "password",
        }
        post "/api/v1/users/sign_in", params: user
        expect(response).to have_http_status :unauthorized
      end


    end
    

  end
end
