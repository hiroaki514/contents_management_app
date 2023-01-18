# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :failed_attempts, :integer, default: 0, null: false, after: :remember_created_at
    add_column :users, :unlock_token, :string, after: :failed_attempts
    add_column :users, :locked_at, :datetime, after: :unlock_token
  end
end
