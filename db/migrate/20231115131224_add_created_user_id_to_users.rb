class AddCreatedUserIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :created_user_id, :integer, after: :locked_at, comment: '作成者'
  end
end
