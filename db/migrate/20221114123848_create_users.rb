# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string 'name', comment: 'ユーザー名'
      t.string 'belonging', comment: '所属'
      t.string 'role', comment: '権限'
      t.timestamps
    end
  end
end
