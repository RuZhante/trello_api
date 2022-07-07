# frozen_string_literal: true

module Users
  # class UserCreateService
  class UserCreateService < ApplicationService
    def initialize(email:, password:)
      @email = email
      @password = password
      super()
    end

    def call
      create_user
    end

    private

    def create_user
      User.create!(email: @email, password: @password)
    end
  end
end
