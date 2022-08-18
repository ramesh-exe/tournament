class ApplicationController < ActionController::API
    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = JsonWebToken.decode(header)
          @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
    end
    
    def generate_token(user)
        token = JsonWebToken.encode(user_id: user.id)
        time = Time.now + 24.hours.to_i
        return { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
            email: user.email }
    end
end
