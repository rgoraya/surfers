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

ActiveRecord::Schema.define(:version => 20130709235767) do

  create_table "helpful_links", :force => true do |t|
    t.string   "link_text",  :null => false
    t.string   "link_href",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "team_members", :force => true do |t|
    t.string   "first_name", :null => false
    t.string   "last_name",  :null => false
    t.string   "position",   :null => false
    t.string   "image_slug", :null => false
    t.text     "bio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tournament_feedbacks", :force => true do |t|
    t.string   "team_name",               :null => false
    t.string   "captain_name"
    t.string   "manager_name"
    t.integer  "management_score"
    t.integer  "umpiring_score"
    t.integer  "competition_level_score"
    t.text     "suggestion"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
