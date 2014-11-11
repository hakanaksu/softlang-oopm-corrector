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

ActiveRecord::Schema.define(version: 20141111181411) do

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.integer  "points"
    t.integer  "order"
    t.date     "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_to_students", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_to_students", ["course_id"], name: "index_course_to_students_on_course_id", using: :btree
  add_index "course_to_students", ["student_id"], name: "index_course_to_students_on_student_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "svn_url"
    t.string   "svn_status", default: "not_checked_out"
    t.integer  "max_points", default: 0
    t.date     "start_date"
    t.date     "end_date"
    t.string   "professor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_to_assignments", force: true do |t|
    t.integer  "assignment_id"
    t.integer  "student_id"
    t.integer  "achieved_points", default: 0
    t.boolean  "public_test",     default: false
    t.boolean  "extra_test",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_to_assignments", ["assignment_id"], name: "index_student_to_assignments_on_assignment_id", using: :btree
  add_index "student_to_assignments", ["student_id"], name: "index_student_to_assignments_on_student_id", using: :btree

  create_table "student_to_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_to_users", ["student_id"], name: "index_student_to_users_on_student_id", using: :btree
  add_index "student_to_users", ["user_id"], name: "index_student_to_users_on_user_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
