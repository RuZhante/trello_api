# frozen_string_literal: true

# class UserCreateService
class UserCreateService < ApplicationService
  def initialize(email:, password:)
    @email = email
    @password = password
    super
  end

  def call
    create_user
  end

  def create_user
    User.create(email: @email, password: @password)
  end

  private_class_method :create_user
end
