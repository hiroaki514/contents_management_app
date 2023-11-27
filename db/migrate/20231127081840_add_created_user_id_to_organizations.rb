class AddCreatedUserIdToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :created_user_id, :integer,  after: :name, comment: '作成者'
  end
end
