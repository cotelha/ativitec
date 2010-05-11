class OrdenServico < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :user
  belongs_to :atividade
  belongs_to :motivo_atividades
  belongs_to :projeto
end
