class AddDefaultToEmpleadoActivo < ActiveRecord::Migration
  def self.up
    change_column :empleados, :activo, :boolean, :default => true
  end

  def self.down
    change_column :empleados, :activo, :boolean
  end
end
