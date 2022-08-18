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

    def sign_in
        @user = User.find_by_email(params[:email])
        if !@user
            return render json: { error: 'invalid_email' }, status: :unauthorized
        end
        
        if @user&.authenticate(params[:password])
            return render json: {:message => 'user_signin'}, status: :ok
        else
            return render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    private
    def user_params
        params.permit(
          :username, :email, :password
        )
    end

end
