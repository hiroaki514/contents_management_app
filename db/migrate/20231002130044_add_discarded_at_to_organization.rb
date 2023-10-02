class AddDiscardedAtToOrganization < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :discarded_at, :datetime
  end
end
