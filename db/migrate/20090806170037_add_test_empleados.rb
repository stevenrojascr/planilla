class AddTestEmpleados < ActiveRecord::Migration
  def self.up
    Empleado.delete_all
    Empleado.create(:cedula => '108770666',
      :nombre => 'BARQUERO GAMBOA MARIANELLA',
      :quincena => 125000,
      :factor_hora_por_quincena => 0.004166,
      :fch_ingreso => '2004-10-01',
      :activo => true)
    Empleado.create(:cedula => '109320848',
      :nombre => 'ROJAS CASTRO KARLA MARCELA',
      :quincena => 150000,
      :factor_hora_por_quincena => 0.004166,
      :fch_ingreso => '2004-02-15',
      :activo => true)
  end

  def self.down
    Empleado.delete_all
  end
end
