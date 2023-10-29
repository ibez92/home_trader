# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, default: ''
      t.decimal :price, null: false, precision: 11, scale: 2

      t.virtual :textsearchable_index,
                type: :tsvector,
                as: "to_tsvector('russian', name || ' ' || description)",
                stored: true

      t.timestamps
    end

    add_index :products, :textsearchable_index, using: :gin
  end
end
