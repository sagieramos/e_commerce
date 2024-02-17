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

ActiveRecord::Schema[7.1].define(version: 20_240_217_102_116) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'chat_files', force: :cascade do |t|
    t.string 'file_name'
    t.bigint 'chat_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['chat_id'], name: 'index_chat_files_on_chat_id'
  end

  create_table 'chats', force: :cascade do |t|
    t.string 'message'
    t.bigint 'sender_id', null: false
    t.bigint 'receiver_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['receiver_id'], name: 'index_chats_on_receiver_id'
    t.index ['sender_id'], name: 'index_chats_on_sender_id'
  end

  create_table 'notifications', force: :cascade do |t|
    t.string 'message'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_notifications_on_user_id'
  end

  create_table 'order_products', force: :cascade do |t|
    t.bigint 'order_id', null: false
    t.bigint 'product_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_order_products_on_order_id'
    t.index ['product_id'], name: 'index_order_products_on_product_id'
  end

  create_table 'product_ratings', force: :cascade do |t|
    t.integer 'star'
    t.bigint 'user_id', null: false
    t.bigint 'product_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_id'], name: 'index_product_ratings_on_product_id'
    t.index ['user_id'], name: 'index_product_ratings_on_user_id'
    t.check_constraint 'star >= 1 AND star <= 5', name: 'star_rating_constraint'
  end

  create_table 'product_review_files', force: :cascade do |t|
    t.string 'file_name'
    t.bigint 'product_review_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_review_id'], name: 'index_product_review_files_on_product_review_id'
  end

  create_table 'product_reviews', force: :cascade do |t|
    t.string 'comments'
    t.bigint 'product_id', null: false
    t.bigint 'buyer_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['buyer_id'], name: 'index_product_reviews_on_buyer_id'
    t.index ['product_id'], name: 'index_product_reviews_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'photo1'
    t.string 'photo2'
    t.string 'photo3'
    t.string 'photo4'
    t.string 'photo5'
    t.string 'photo6'
    t.decimal 'price'
    t.bigint 'seller_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['seller_id'], name: 'index_products_on_seller_id'
  end

  create_table 'shopping_orders', force: :cascade do |t|
    t.bigint 'buyer_id', null: false
    t.integer 'product_quantity'
    t.decimal 'total_price'
    t.string 'payment_method'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['buyer_id'], name: 'index_shopping_orders_on_buyer_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', limit: 255, null: false
    t.string 'username', limit: 255, null: false
    t.string 'avatar', limit: 255
    t.string 'contact_email', limit: 1024
    t.string 'phone1', limit: 15
    t.string 'phone2', limit: 15
    t.string 'address', limit: 1024
    t.string 'recent_position', limit: 255
    t.string 'zip', limit: 15
    t.boolean 'can_sell', default: false
    t.boolean 'can_buy', default: true
    t.boolean 'admin', default: false
    t.string 'govt_issue_id', limit: 255
    t.boolean 'verified', default: false
    t.boolean 'super_admin', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'chat_files', 'chats'
  add_foreign_key 'chats', 'users', column: 'receiver_id'
  add_foreign_key 'chats', 'users', column: 'sender_id'
  add_foreign_key 'notifications', 'users'
  add_foreign_key 'order_products', 'products'
  add_foreign_key 'order_products', 'shopping_orders', column: 'order_id'
  add_foreign_key 'product_ratings', 'products'
  add_foreign_key 'product_ratings', 'users'
  add_foreign_key 'product_review_files', 'product_reviews'
  add_foreign_key 'product_reviews', 'products'
  add_foreign_key 'product_reviews', 'users', column: 'buyer_id'
  add_foreign_key 'products', 'users', column: 'seller_id'
  add_foreign_key 'shopping_orders', 'users', column: 'buyer_id'
end
