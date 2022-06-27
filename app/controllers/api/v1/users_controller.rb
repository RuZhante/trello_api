# frozen_string_literal: true

module Api
  module V1
    # class UserController
    class UsersController < ApplicationController
      before_action :authorize_request, except: %i[create]
      # before_action :find_user, expect: %i[create index]

      def index
        users = Users::UserFindAllService.call

        render json users, status: :ok
      end

      def create
        saved_user = Users::UserCreateService.call(email: user_params[:email], password: user_params[:password],
                                                   password_confirmation: user_params[:password_confirmation])
        render json: {
          user: saved_user
        }, status: :created
      end

      def update
        if @current_user.update(user_params)

          render json: @current_user, status: :created
        else
          render json: { errors: @current_user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @current_user.destroy
      end

      private

      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
