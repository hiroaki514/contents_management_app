class AddDiscardedAtToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :discarded_at, :datetime, before: :created_at, comment: '削除日時'
  end
end
