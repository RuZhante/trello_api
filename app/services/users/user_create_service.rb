# frozen_string_literal: true

module Users
  # class UserCreateService
  class UserCreateService < ApplicationService
    def initialize(email:, password:, password_digest:)
      @email = email
      @password = password
      @password_digest = password_digest
      super()
    end

    def call
      create_user
    end

    private

    def create_user
      User.create!(email: @email, password: @password, password_digest: @password_digest)
    end
  end
end
