# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091229012843) do

  create_table "ausencias", :force => true do |t|
    t.integer  "empleado_id",                                   :null => false
    t.date     "fecha",                                         :null => false
    t.string   "evento",        :limit => 3, :default => "AUS", :null => false
    t.integer  "dias",                       :default => 0
    t.integer  "horas",                      :default => 0
    t.integer  "minutos",                    :default => 0
    t.string   "motivo",        :limit => 3, :default => "INJ", :null => false
    t.text     "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empleados", :force => true do |t|
    t.string   "cedula"
    t.string   "nombre"
    t.decimal  "quincena"
    t.decimal  "factor_hora_por_quincena"
    t.date     "fch_ingreso"
    t.boolean  "activo",                   :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "foto_url",                 :default => "/images/silueta.png"
    t.string   "tel_casa"
    t.string   "tel_movil"
  end

end
