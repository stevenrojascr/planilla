class AddTelefonosToEmpleados < ActiveRecord::Migration
  def self.up
    add_column :empleados, :tel_casa, :string
    add_column :empleados, :tel_movil, :string
  end

  def self.down
    remove_column :empleados, :tel_movil
    remove_column :empleados, :tel_casa
  end
end
