# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_16_181615) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_files", force: :cascade do |t|
    t.string "file_name"
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_chat_files_on_chat_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "message"
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_chats_on_receiver_id"
    t.index ["sender_id"], name: "index_chats_on_sender_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "phone1"
    t.string "phone2"
    t.string "ZIP"
    t.bigint "user_id", null: false
    t.bigint "super_admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["super_admin_id"], name: "index_contacts_on_super_admin_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "photo1"
    t.string "photo2"
    t.string "photo3"
    t.string "photo4"
    t.string "photo5"
    t.string "photo6"
    t.decimal "price"
    t.bigint "seller_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_products_on_seller_id"
  end

  create_table "review_files", force: :cascade do |t|
    t.string "file_name"
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_review_files_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comments"
    t.integer "star_rating"
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shopping_orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.integer "product_quantity"
    t.decimal "total_price"
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_shopping_orders_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "avatar"
    t.boolean "can_sell"
    t.boolean "can_buy"
    t.boolean "admin"
    t.string "govt_issue_id"
    t.boolean "verified"
    t.boolean "super_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chat_files", "chats"
  add_foreign_key "chats", "users", column: "receiver_id"
  add_foreign_key "chats", "users", column: "sender_id"
  add_foreign_key "contacts", "users"
  add_foreign_key "contacts", "users", column: "super_admin_id"
  add_foreign_key "notifications", "users"
  add_foreign_key "order_products", "products"
  add_foreign_key "order_products", "shopping_orders", column: "order_id"
  add_foreign_key "products", "users", column: "seller_id"
  add_foreign_key "review_files", "reviews"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
  add_foreign_key "shopping_orders", "users", column: "customer_id"
end
