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

ActiveRecord::Schema.define(:version => 20131111064155) do

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "master",     :default => false
  end

  create_table "categories", :force => true do |t|
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "category_translations", :force => true do |t|
    t.integer  "category_id"
    t.string   "locale"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image"
  end

  add_index "category_translations", ["category_id"], :name => "index_category_translations_on_category_id"
  add_index "category_translations", ["locale"], :name => "index_category_translations_on_locale"

  create_table "classphotos", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "productclass_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "indexlink_translations", :force => true do |t|
    t.integer  "indexlink_id"
    t.string   "locale"
    t.string   "image"
    t.string   "title"
    t.string   "link"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "indexlink_translations", ["indexlink_id"], :name => "index_indexlink_translations_on_indexlink_id"
  add_index "indexlink_translations", ["locale"], :name => "index_indexlink_translations_on_locale"

  create_table "indexlinks", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "ordernum"
    t.string   "fontcolor"
    t.text     "content"
    t.string   "titlesub"
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

  create_table "product_translations", :force => true do |t|
    t.integer  "product_id"
    t.string   "locale"
    t.text     "content"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "product_translations", ["locale"], :name => "index_product_translations_on_locale"
  add_index "product_translations", ["product_id"], :name => "index_product_translations_on_product_id"

  create_table "productasklists", :force => true do |t|
    t.integer  "productask_id"
    t.integer  "product_id"
    t.string   "productname"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "productasks", :force => true do |t|
    t.string   "askername"
    t.string   "askertel"
    t.string   "askermail"
    t.string   "purpose"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "status"
    t.text     "note"
    t.string   "askercompany"
    t.string   "country"
    t.string   "subject"
    t.string   "askamount"
  end

  create_table "productclass_translations", :force => true do |t|
    t.integer  "productclass_id"
    t.string   "locale"
    t.text     "content"
    t.string   "name"
    t.string   "frontshow"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "productclass_translations", ["locale"], :name => "index_productclass_translations_on_locale"
  add_index "productclass_translations", ["productclass_id"], :name => "index_productclass_translations_on_productclass_id"

  create_table "productclasses", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "addDate"
    t.string   "class_type"
  end

  create_table "productphotos", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "productclass_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "status"
    t.date     "addDate"
  end

end
