# frozen_string_literal: true

# class CreateUsers
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
