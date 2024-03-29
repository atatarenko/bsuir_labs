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

ActiveRecord::Schema.define(version: 20171210121414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "labs", force: :cascade do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.string   "state",                    null: false
    t.integer  "rank",        default: 0,  null: false
    t.string   "description", default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "mark_id"
    t.index ["mark_id"], name: "index_labs_on_mark_id", using: :btree
    t.index ["subject_id"], name: "index_labs_on_subject_id", using: :btree
  end

  create_table "marks", force: :cascade do |t|
    t.integer "value"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name",                     null: false
    t.integer  "term_id"
    t.string   "description", default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "teacher_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id", using: :btree
    t.index ["term_id"], name: "index_subjects_on_term_id", using: :btree
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_teachers_on_user_id", using: :btree
  end

  create_table "terms", force: :cascade do |t|
    t.integer  "course",      null: false
    t.integer  "term_number", null: false
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id", "course", "term_number"], name: "index_terms_on_user_id_and_course_and_term_number", unique: true, using: :btree
    t.index ["user_id"], name: "index_terms_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
