class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false, comment: "組織名"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
