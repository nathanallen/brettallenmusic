# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140314204534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arrangements", force: true do |t|
    t.string   "version"
    t.string   "instrumentation"
    t.integer  "sheet_music_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "price"
    t.string   "format"
    t.string   "external_purchase_link"
    t.string   "vendor"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "stripe_token"
    t.string   "stripe_customer_id"
    t.string   "description"
    t.integer  "amount"
    t.boolean  "completed",                default: false
    t.string   "email"
    t.string   "billing_name"
    t.string   "billing_address_line1"
    t.string   "billing_address_zip"
    t.string   "billing_address_city"
    t.string   "billing_address_state"
    t.string   "billing_address_country"
    t.string   "shipping_name"
    t.string   "shipping_address_line1"
    t.string   "shipping_address_zip"
    t.string   "shipping_address_city"
    t.string   "shipping_address_state"
    t.string   "shipping_address_country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders_items", force: true do |t|
    t.integer "orders_id"
    t.integer "items_id"
  end

  create_table "parts", force: true do |t|
    t.string   "version"
    t.string   "instrument"
    t.string   "scribd_sample_link"
    t.integer  "arrangement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sheet_musics", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.string   "genre"
    t.string   "duration"
    t.string   "soundcloud_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
