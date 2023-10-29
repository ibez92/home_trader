# frozen_string_literal: true

class CreatePenalties < ActiveRecord::Migration[7.1]
  def change
    create_table :penalties do |t|
      t.string :name, null: false
      t.text :description, default: ''
      t.decimal :price, precision: 11, scale: 2

      t.timestamps
    end
  end
end
