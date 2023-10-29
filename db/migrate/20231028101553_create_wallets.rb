# frozen_string_literal: true

class CreateWallets < ActiveRecord::Migration[7.1]
  def change
    create_table :wallets do |t|
      t.decimal :amount, null: false, default: 0
      t.bigint :family_member_id, null: false, index: true

      t.timestamps
    end
  end
end
