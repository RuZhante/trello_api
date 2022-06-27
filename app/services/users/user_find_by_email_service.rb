# frozen_string_literal: true

module Users
  # class UserFindByEmailService
  class UserFindByEmailService < ApplicationService
    def initialize(email:)
      @email = email
      super()
    end

    def call
      find_by_email
    end

    def find_by_email
      User.find_by email: @email
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
    end
  end
end
