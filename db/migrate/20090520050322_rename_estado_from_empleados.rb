class RenameEstadoFromEmpleados < ActiveRecord::Migration
  def self.up
    rename_column :empleados, :estado, :activo
  end

  def self.down
    rename_column :empleados, :activo, :estado
  end
end
