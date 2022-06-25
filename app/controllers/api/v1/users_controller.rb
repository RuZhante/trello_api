# frozen_string_literal: true

module Api
  module V1
    # class UserController
    class UsersController < ApplicationController
      before_action :authorize_request, expect: :create
      before_action :find_user, expect: %i[create index]

      def create
        saved_user = Users::UserCreateService.call(email: user_params[:email], password: user_params[:password],
                                                   password_confirmation: user_params[:password_confirmation])
        render json: {
          user: saved_user
        }, status: :created
      end

      private

      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
