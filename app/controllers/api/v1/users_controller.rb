# frozen_string_literal: true

module API
  module V1
    # class UserController
    class UsersController < ApplicationController
      def new; end

      def create
        saved_user = User::UserCreateService.call(email: user_params[:email], password: user_params[:password])
        render json: {
          user: saved_user
        }, status: :created
      end

      private

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
