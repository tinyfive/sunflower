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

ActiveRecord::Schema.define(version: 20170925003133) do

  create_table "applies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id"
    t.integer  "disease_id"
    t.integer  "creator_id"
    t.integer  "archive_number"
    t.integer  "status",                                              default: 0, null: false
    t.boolean  "insured"
    t.boolean  "commercial_insured"
    t.integer  "hospital_id"
    t.decimal  "expense_amount",                       precision: 10
    t.decimal  "affordable_amount",                    precision: 10
    t.decimal  "hospital_advice_amount",               precision: 10
    t.date     "estimate_discharge_at"
    t.text     "reason",                 limit: 65535
    t.boolean  "once_applied"
    t.string   "once_applied_remark"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_applies_on_deleted_at", using: :btree
    t.index ["disease_id"], name: "index_applies_on_disease_id", using: :btree
  end

  create_table "approvals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "creator_id"
    t.integer  "status",                                  default: 0, null: false
    t.integer  "apply_id",                                            null: false
    t.integer  "category",                                default: 0, null: false
    t.text     "remark",     limit: 65535
    t.decimal  "aid_amount",               precision: 10
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["apply_id"], name: "index_approvals_on_apply_id", using: :btree
  end

  create_table "diseases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category",   default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "gender",                           default: 0
    t.boolean  "birth_certificated",               default: false
    t.integer  "id_type",                          default: 0
    t.string   "id_number"
    t.date     "birthday"
    t.text     "remark",             limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "social_relations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "relationship",                 default: 0, null: false
    t.string   "name"
    t.string   "tel"
    t.string   "employer"
    t.string   "employer_tel"
    t.decimal  "income_amount", precision: 10
    t.integer  "patient_id",                               null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "table_tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float   "lng_bak", limit: 24
    t.float   "lat_bak", limit: 24
    t.decimal "lng",                precision: 10, scale: 6
    t.decimal "lat",                precision: 10, scale: 6
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.integer  "mobile"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "applies", "diseases"
  add_foreign_key "approvals", "applies"
end
