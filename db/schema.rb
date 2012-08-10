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

ActiveRecord::Schema.define(:version => 20120810214304) do

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "feedback_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "comments", ["feedback_id"], :name => "index_comments_on_feedback_id"

  create_table "feedbacks", :force => true do |t|
    t.string   "email"
    t.string   "message"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "sender_email"
    t.string   "confirmation_code"
  end

  add_index "feedbacks", ["email"], :name => "index_feedbacks_on_email"

  create_table "pending_users", :force => true do |t|
    t.string   "email"
    t.string   "secret"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pending_users", ["email"], :name => "index_pending_users_on_email", :unique => true
  add_index "pending_users", ["secret"], :name => "index_pending_users_on_secret", :unique => true

  create_table "unsubscribes", :force => true do |t|
    t.string   "email"
    t.string   "token"
    t.boolean  "unsubscribed", :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "unsubscribes", ["email"], :name => "index_unsubscribes_on_email", :unique => true
  add_index "unsubscribes", ["token"], :name => "index_unsubscribes_on_token", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
