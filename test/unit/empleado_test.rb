require 'test_helper'


class EmpleadoTest < ActiveSupport::TestCase
  
  fixtures :empleados
  
  def setup
    @manuel = empleados(:manuel) # un empleado normal
  end
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "defaults vacíos o diferentes" do
    empleado = Empleado.new
    #El atributo activo debe tener true como default
    assert empleado.activo?, "activo sin valor default o diferente."
    # El atributo foto_url debe tener "/imagenes/silueta.png" como default
    assert_equal 0, (empleado.foto_url.casecmp "/images/silueta.png"), "Foto sin valor default o diferente."
  end
  
  test "valores no válidos para los atributos" do
    assert @manuel.valid?, "manuel debía ser válido"
    assert_invalid_value @manuel, :cedula,      [nil, '', ' ', 'abc','123','1234567890','012345678']
    assert_invalid_value @manuel, :nombre,      [nil, '', ' ']
    assert_invalid_value @manuel, :fch_ingreso, [nil, '', ' ', 'abc', '123', '2009/-002-01','11111-22-333', '2009-02-29']
    assert_invalid_value @manuel, :quincena,    [nil,'',' ','abc', -1, 0, 1]
    assert_invalid_value @manuel, :factor_hora_por_quincena, [nil, '', ' ', 'abc']
    assert_invalid_value @manuel, :activo,      [nil, '', ' ', 'abc']
    assert_invalid_value @manuel, :foto_url,    [nil, '', ' ', 'abc']
  end

  test "valores válidos para los atributos" do
    assert @manuel.valid?, "manuel debía ser válido"
    assert_valid_value @manuel, :cedula,      ['123456789', '102220333']
    assert_valid_value @manuel, :nombre,      ['Manuel Segura', 'SALAZAR UGALDE CRISTINA']
    assert_valid_value @manuel, :fch_ingreso, ['2008-01-15', '2007-12-01','2012-02-29']
    assert_valid_value @manuel, :quincena,    [125000, 250000]
    assert_valid_value @manuel, :factor_hora_por_quincena, [100, 90]
    assert_valid_value @manuel, :activo,      [true , 1] #FIXME no funciona para false
    assert_valid_value @manuel, :foto_url,    ['foto.gif', 'foto.jpg', 'foto.png', 'FOTo.JPG']
  end
  
  test "cédula única" do
    empleado = Empleado.new(  :cedula       => @manuel.cedula,
                              :nombre       => 'JORGE CON CEDULA MANUEL',
                              :fch_ingreso  => '2008-02-23',
                              :quincena     => 115000,
                              :factor_hora_por_quincena =>  100)
    assert !empleado.save
    assert_equal "has already been taken", empleado.errors.on(:cedula), "La cédula ya existe"
  end

end

