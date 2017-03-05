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

ActiveRecord::Schema.define(version: 20170224052559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.string   "slug"
    t.string   "description",   limit: 1000
    t.string   "image"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["restaurant_id"], name: "index_categories_on_restaurant_id", using: :btree
    t.index ["slug", "restaurant_id"], name: "index_categories_on_slug_and_restaurant_id", using: :btree
  end

  create_table "catering_exceptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "catering_id"
    t.integer  "delivery_qty",  default: 2
    t.date     "delivery_date"
    t.string   "comments"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["catering_id"], name: "index_catering_exceptions_on_catering_id", using: :btree
    t.index ["user_id"], name: "index_catering_exceptions_on_user_id", using: :btree
  end

  create_table "caterings", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.decimal  "price",                            precision: 10, scale: 2, default: "0.0"
    t.integer  "calories",                                                  default: 1500
    t.integer  "week_delivery_qty",                                         default: 5
    t.integer  "ordered_qty",                                               default: -1
    t.integer  "delivered_qty",                                             default: 0
    t.string   "comments",            limit: 1000
    t.date     "delivery_start_date"
    t.boolean  "is_active",                                                 default: true
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.index ["restaurant_id"], name: "index_caterings_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_caterings_on_user_id", using: :btree
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "catering_id"
    t.integer  "delivery_qty", default: 1
    t.boolean  "is_paid",      default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["catering_id"], name: "index_deliveries_on_catering_id", using: :btree
    t.index ["user_id"], name: "index_deliveries_on_user_id", using: :btree
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "supplier_id"
    t.string   "invoice_number"
    t.boolean  "is_paid",        default: false
    t.date     "issue_date"
    t.date     "due_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["restaurant_id"], name: "index_expenses_on_restaurant_id", using: :btree
    t.index ["supplier_id"], name: "index_expenses_on_supplier_id", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "meal_id"
    t.integer  "product_id"
    t.decimal  "quantity",      precision: 10, scale: 2, default: "1.0"
    t.string   "qty_type",                               default: "gr"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["meal_id", "product_id"], name: "index_ingredients_on_meal_id_and_product_id", using: :btree
    t.index ["meal_id"], name: "index_ingredients_on_meal_id", using: :btree
    t.index ["product_id"], name: "index_ingredients_on_product_id", using: :btree
    t.index ["restaurant_id"], name: "index_ingredients_on_restaurant_id", using: :btree
  end

  create_table "meal_options", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "category_id"
    t.string   "name"
    t.decimal  "price",         precision: 10, scale: 2, default: "0.0"
    t.decimal  "gross_price",   precision: 10, scale: 2, default: "0.0"
    t.decimal  "vat",           precision: 5,  scale: 2, default: "1.08"
    t.decimal  "quantity",      precision: 10, scale: 2, default: "1.0"
    t.string   "qty_type",                               default: "gr"
    t.boolean  "is_available",                           default: true
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.index ["category_id"], name: "index_meal_options_on_category_id", using: :btree
    t.index ["restaurant_id"], name: "index_meal_options_on_restaurant_id", using: :btree
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "restaurant_id"
    t.string   "name"
    t.decimal  "price",         precision: 10, scale: 2, default: "0.0"
    t.decimal  "gross_price",   precision: 10, scale: 2, default: "0.0"
    t.decimal  "vat",           precision: 5,  scale: 2, default: "1.08"
    t.boolean  "is_available",                           default: true
    t.string   "register_code"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.index ["category_id", "restaurant_id"], name: "index_meals_on_category_id_and_restaurant_id", using: :btree
    t.index ["category_id"], name: "index_meals_on_category_id", using: :btree
    t.index ["restaurant_id"], name: "index_meals_on_restaurant_id", using: :btree
  end

  create_table "measures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.decimal  "quantity",      precision: 10, scale: 2, default: "1.0"
    t.string   "qty_type",                               default: "gr"
    t.decimal  "price",         precision: 10, scale: 2, default: "0.0"
    t.decimal  "gross_price",   precision: 10, scale: 2, default: "0.0"
    t.decimal  "vat",           precision: 5,  scale: 2, default: "1.05"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "invoice_id",                             default: 0
    t.index ["invoice_id"], name: "index_products_on_invoice_id", using: :btree
    t.index ["restaurant_id"], name: "index_products_on_restaurant_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "domain"
    t.string   "street"
    t.string   "city"
    t.string   "postcode"
    t.string   "logo_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "phone"
    t.index ["domain"], name: "index_restaurants_on_domain", using: :btree
    t.index ["user_id"], name: "index_restaurants_on_user_id", using: :btree
    t.index ["user_id"], name: "rest_user_idx", using: :btree
  end

  create_table "suppliers", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "nip"
    t.string   "company"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_suppliers_on_restaurant_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "phone"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "role_type",              default: "customer"
    t.boolean  "is_trusted",             default: false
    t.string   "address"
    t.string   "city"
    t.string   "post_code"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
