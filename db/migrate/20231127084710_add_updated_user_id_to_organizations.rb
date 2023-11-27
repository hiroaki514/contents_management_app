class AddUpdatedUserIdToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :updated_user_id, :integer,  after: :created_user_id, comment: '更新者'
  end
end
