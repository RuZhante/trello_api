# frozen_string_literal: true

# ApplicatonService Class
class ApplicationService
  def self.call(*args)
    new(*args).call
  end
end
