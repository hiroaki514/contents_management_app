class AddDiscardedAtToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :discarded_at, :datetime
  end
end
