# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100428163414) do

  create_table "ads", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "valid_til"
    t.integer  "rating"
  end

  create_table "classifieds", :force => true do |t|
    t.string   "title"
    t.text     "two_liner"
    t.text     "description"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "clients", :force => true do |t|
    t.text     "description"
    t.integer  "location_id"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.integer  "parent_id"
    t.string   "title"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "egalleries", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "two_liner"
    t.integer  "location_id"
    t.string   "state"
  end

  create_table "location_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_type_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "title"
    t.text     "address"
    t.text     "description"
    t.integer  "door_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "location_type_id"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "navlabel"
    t.text     "body"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.date     "date"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "position"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "two_liner"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "temp_uploads", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "egallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "position"
    t.boolean  "processing",         :default => true
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
