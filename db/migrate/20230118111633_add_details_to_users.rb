# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.integer :failed_attempts, default: 0, null: false, after: :remember_created_at
      t.string :unlock_token, after: :failed_attempts
      t.datetime :locked_at, after: :unlock_token
    end
  end
end
