# frozen_string_literal: true

module Users
  # class UserCreateService
  class UserCreateService < ApplicationService
    def initialize(email:, password:, password_confirmation:)
      @email = email
      @password = password
      @password_digest = password_confirmation
      super()
    end

    def call
      create_user
    end

    private

    def create_user
      User.create!(email: @email, password: @password, password_confirmation: @password_confirmation)
    end
  end
end
