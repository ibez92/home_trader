# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.bigint :family_member_id, null: false, index: true
      t.string :transactionable_type, null: false
      t.bigint :transactionable_id, null: false

      t.timestamps
    end

    add_index :transactions, %i[transactionable_id transactionable_type]
  end
end
