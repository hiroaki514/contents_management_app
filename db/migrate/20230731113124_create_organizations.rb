# frozen_string_literal: true

class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false, comment: '組織名'

      t.timestamps
    end
  end
end
