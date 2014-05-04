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

ActiveRecord::Schema.define(version: 20140419174437) do

  create_table "peladas", force: true do |t|
    t.datetime "data"
    t.string   "local"
    t.integer  "minimo_pessoas"
    t.float    "custo"
    t.string   "responsavel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "peladas_usuarios", force: true do |t|
    t.integer  "pelada_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "peladas_usuarios", ["pelada_id"], name: "index_peladas_usuarios_on_pelada_id"
  add_index "peladas_usuarios", ["usuario_id"], name: "index_peladas_usuarios_on_usuario_id"

  create_table "usuarios", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end