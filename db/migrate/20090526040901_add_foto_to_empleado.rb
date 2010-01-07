class AddFotoToEmpleado < ActiveRecord::Migration
  def self.up
    add_column :empleados, :foto_url, :string, :default => '/images/silueta.png'
  end

  def self.down
    remove_column :empleados, :foto_url
  end
end
