# frozen_string_literal: true

# AddPassword
class AddPassword < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password, :string
  end
end
