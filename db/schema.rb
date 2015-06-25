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

ActiveRecord::Schema.define(version: 20150624234051) do

  create_table "adresses", force: :cascade do |t|
    t.string   "adress"
    t.integer  "zipcode"
    t.string   "city"
    t.string   "phone"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  add_index "adresses", ["order_id"], name: "index_adresses_on_order_id"

  create_table "authors", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.text     "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.float    "price"
    t.integer  "in_stock"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "author_id"
    t.integer  "category_id"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id"
  add_index "books", ["category_id"], name: "index_books_on_category_id"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "number"
    t.integer  "cvv"
    t.string   "expiration_month"
    t.string   "expiration_year"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.float    "total_price"
    t.datetime "completed_date"
    t.string   "state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "customer_id"
    t.integer  "credit_card_id"
  end

  add_index "orders", ["credit_card_id"], name: "index_orders_on_credit_card_id"
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "ratings", force: :cascade do |t|
    t.text     "text_review"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
    t.integer  "book_id"
  end

  add_index "ratings", ["book_id"], name: "index_ratings_on_book_id"
  add_index "ratings", ["customer_id"], name: "index_ratings_on_customer_id"

end
