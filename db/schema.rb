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

ActiveRecord::Schema.define(:version => 20130321101947) do

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "classphotos", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "productclass_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "indexlinks", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "ordernum"
  end

  create_table "news", :force => true do |t|
    t.string   "name"
    t.text     "content",    :limit => 255
    t.boolean  "frontshow"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "newsphotos", :force => true do |t|
    t.string   "image"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "news_id"
  end

  create_table "productclasses", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "frontshow"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "productclass_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
