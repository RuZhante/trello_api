# frozen_string_literal: true

# class UserSerializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
end
