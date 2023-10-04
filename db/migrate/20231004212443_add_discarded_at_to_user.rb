class AddDiscardedAtToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :discarded_at, :datetime, after: :name, comment: '削除日時'
  end
end
