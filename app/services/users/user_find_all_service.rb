# frozen_string_literal: true

module Users
  # class UserFindAllService
  class UserFindAllService < ApplicationService
    def call
      find_all
    end

    private

    def find_all
      User.all
    end
  end
end
