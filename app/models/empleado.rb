# == Schema Information
# Schema version: 20091229012843
#
# Table name: empleados
#
#  id                       :integer         not null, primary key
#  cedula                   :string(255)
#  nombre                   :string(255)
#  quincena                 :decimal(, )
#  factor_hora_por_quincena :decimal(, )
#  fch_ingreso              :date
#  activo                   :boolean         default(TRUE)
#  created_at               :datetime
#  updated_at               :datetime
#  foto_url                 :string(255)     default("/images/silueta.png")
#  tel_casa                 :string(255)
#  tel_movil                :string(255)
#

class Empleado < ActiveRecord::Base
  has_many :ausencias
  validates_presence_of :cedula, :nombre, :quincena, :factor_hora_por_quincena, :fch_ingreso, :activo, :foto_url
  validates_numericality_of :quincena, :factor_hora_por_quincena
  validate :quincena_mayor_a_salario_minimo
  validates_uniqueness_of :cedula
  validates_format_of :cedula, 
                      :with => /^[1-9]{1}[0-9]{8}$/, 
                      :message => "deben ser 9 dígitos"
  validates_format_of :fch_ingreso,
                      :with => /^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/,
                      :message => 'debe ser una fecha en formato aaaa-mm-dd'
  validates_format_of :foto_url,
                      :with => %r{\.(gif|jpg|png|tiff)$}i,
                      :message => 'debe ser una url para una imagen GIF, JPG, PNG o TIFF.'
  validates_format_of :tel_casa,
                      :with => /^[2]{1}[0-9]{7}$/, 
                      :message => "deben ser 8 dígitos e iniciar con 2"
  validates_format_of :tel_movil, 
                      :with => /^[8]{1}[0-9]{7}$/, 
                      :message => "deben ser 8 dígitos e iniciar con 8"

  protected
    def quincena_mayor_a_salario_minimo
      errors.add(:quincena, 'debe ser mayor al salario mínimo de 95.000') if quincena.nil? ||
                    quincena < 95000
    end
end
