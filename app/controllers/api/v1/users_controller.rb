# frozen_string_literal: true

module Api
  module V1
    # class UserController
    class UsersController < ApplicationController
      def create
        saved_user = Users::UserCreateService.call(email: user_params[:email], password: user_params[:password],
                                                   password_digest: user_params[:password_digest])
        render json: {
          user: saved_user
        }, status: :created
      end

      private

      def user_params
        params.permit(:email, :password, :password_digest)
      end
    end
  end
end
