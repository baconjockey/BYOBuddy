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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111210055051) do

  create_table "beer_styles", :force => true do |t|
    t.string   "name"
    t.string   "aka"
    t.string   "country_of_origin"
    t.string   "sample_brands"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pairing_descriptors", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pairings", :force => true do |t|
    t.integer  "beer_style_id"
    t.integer  "pairing_descriptor_id"
    t.text     "reasoning"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
