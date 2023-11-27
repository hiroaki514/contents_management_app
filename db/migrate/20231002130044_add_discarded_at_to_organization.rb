# frozen_string_literal: true

class AddDiscardedAtToOrganization < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :discarded_at, :datetime, after: :created_at, comment: '削除日時'
  end
end
