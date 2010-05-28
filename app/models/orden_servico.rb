class OrdenServico < ActiveRecord::Base

  validates_presence_of :nm_contato

  validates_presence_of :projeto

  belongs_to :cliente
  belongs_to :user
  belongs_to :atividade
  belongs_to :motivo_atividade
  belongs_to :projeto

  has_many :os_historicos
end
