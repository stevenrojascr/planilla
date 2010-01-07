class CreateAusencias < ActiveRecord::Migration
  def self.up
    create_table :ausencias do |t|
      t.integer :empleado_id, :null => false, :options =>
        "CONSTRAINT fk_ausencia_empleados REFERENCES empleados(id)"
      t.date :fecha, :null => false
      t.string :evento, :null => false, :limit => 3, :default => "AUS"
      t.integer :dias, :horas, :minutos, :default => 0
      t.string :motivo, :null => false, :limit => 3, :default => "INJ"
      t.text :observaciones

      t.timestamps
    end
  end

  def self.down
    drop_table :ausencias
  end
end
