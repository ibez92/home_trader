# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_231_028_101_902) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'families', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'family_members', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'family_id', null: false
    t.datetime 'deleted_at', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['family_id'], name: 'index_family_members_on_family_id'
    t.index %w[user_id family_id], name: 'index_family_members_on_user_id_and_family_id'
  end

  create_table 'penalties', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', default: ''
    t.decimal 'price', precision: 11, scale: 2
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', default: ''
    t.decimal 'price', precision: 11, scale: 2, null: false
    t.virtual 'textsearchable_index', type: :tsvector,
                                      as: "to_tsvector('russian'::regconfig, (((name)::text || ' '::text) || description))", stored: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['textsearchable_index'], name: 'index_products_on_textsearchable_index', using: :gin
  end

  create_table 'rewards', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', default: ''
    t.decimal 'price', precision: 11, scale: 2
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'transactions', force: :cascade do |t|
    t.bigint 'family_member_id', null: false
    t.string 'transactionable_type', null: false
    t.bigint 'transactionable_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['family_member_id'], name: 'index_transactions_on_family_member_id'
    t.index %w[transactionable_id transactionable_type],
            name: 'idx_on_transactionable_id_transactionable_type_1232702816'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'middle_name'
    t.string 'email'
    t.string 'password_digest', null: false
    t.date 'birthday', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email'
  end

  create_table 'wallets', force: :cascade do |t|
    t.decimal 'amount', default: '0.0', null: false
    t.bigint 'family_member_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['family_member_id'], name: 'index_wallets_on_family_member_id'
  end
end
