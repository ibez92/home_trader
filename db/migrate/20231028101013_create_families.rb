# frozen_string_literal: true

class CreateFamilies < ActiveRecord::Migration[7.1]
  def change
    create_table :families do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
