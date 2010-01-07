# == Schema Information
# Schema version: 20091229012843
#
# Table name: ausencias
#
#  id            :integer         not null, primary key
#  empleado_id   :integer         not null
#  fecha         :date            not null
#  evento        :string(3)       default("AUS"), not null
#  dias          :integer         default(0)
#  horas         :integer         default(0)
#  minutos       :integer         default(0)
#  motivo        :string(3)       default("INJ"), not null
#  observaciones :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Ausencia < ActiveRecord::Base
  belongs_to :empleado
  validates_presence_of :empleado_id, :fecha, :evento, :motivo
  validates_format_of :fecha,
                      :with => /^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/,
                      :message => 'debe ser una fecha en formato aaaa-mm-dd'
  validates_inclusion_of :evento, :in => %w{ AUS TAR ABA }, 
                      :message => "evento %s no incluido en la lista AUS-ausencia, TAR-tardía, ABA-abandono"
  validates_inclusion_of :motivo, :in => %w{ INJ PSI ICP VAC PCO }, 
                      :message => "evento %s no incluido en la lista INJ-injustificada, PSI-permiso sin goce, ICP-incapacidad, VAC-vacación, PCO-permiso con  goce."
  validate :empleado_must_exist

  protected
  def empleado_must_exist
    errors.add(:empleado_id, "debe apuntar a un empleado existente") if empleado_id && empleado.nil?
  end
end
