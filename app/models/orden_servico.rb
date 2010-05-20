class OrdenServico < ActiveRecord::Base

  validates_presence_of :nm_contato

  belongs_to :cliente
  belongs_to :user
  belongs_to :atividade
  belongs_to :motivo_atividade
  belongs_to :projeto
end
