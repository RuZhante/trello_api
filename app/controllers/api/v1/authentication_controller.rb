# frozen_string_literal: true

module Api
  module V1
    # class AuthenticationController
    class AuthenticationController < ApplicationController
      before_action :authorize_request, except: :login

      def login
        @user = Users::UserFindByEmailService.call(email: login_params[:email])
        if @user&.authenticate(login_params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i

          render json: { user: ActiveModelSerializers::SerializableResource.new(@user, serializer: UserSerializer),
                         token:, exp: time.strftime('%m-%d-%Y %H:%M') }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      private

      def login_params
        params.permit(:email, :password)
      end
    end
  end
end
