class Api::V1::Users::UsersController < ApplicationController

    def sign_up
        @user = User.new(user_params)

        if @user.save
            return render json: {:message => 'user_registered'}, status: :created
        else
            return render json: { errors: @user.errors },
                   status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.permit(
          :username, :email, :password
        )
    end

end
