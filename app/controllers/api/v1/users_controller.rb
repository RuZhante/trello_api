# frozen_string_literal: true

module Api
  module V1
    # class UserController
    class UsersController < ApplicationController
      before_action :authorize_request, except: %i[create]
      # before_action :find_user, except: %i[create index]

      def index
        users = Users::UserFindAllService.call

        render json: {
          users: ActiveModelSerializers::SerializableResource.new(users, each_serializer: UserSerializer)
        }
      end

      def create
        saved_user = Users::UserCreateService.call(email: user_params[:email], password: user_params[:password])

        render json: {
          user: ActiveModelSerializers::SerializableResource.new(saved_user, serializer: UserSerializer)
        }, status: :created
      end

      def update
        if @current_user.update(user_params.to_h)

          render json: {
            user: ActiveModelSerializers::SerializableResource.new(@current_user, serializer: UserSerializer)
          }, status: :created
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
        params
          .require(:user)
          .permit(:id, :email, :password, :password_confirmation)
      end
    end
  end
end
