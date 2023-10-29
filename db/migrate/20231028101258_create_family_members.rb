# frozen_string_literal: true

class CreateFamilyMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :family_members do |t|
      t.bigint :user_id, null: false
      t.bigint :family_id, null: false
      t.timestamp :deleted_at

      t.timestamps
    end

    add_index :family_members, %i[user_id family_id]
    add_index :family_members, :family_id
  end
end
