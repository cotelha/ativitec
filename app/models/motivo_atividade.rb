class MotivoAtividade < ActiveRecord::Base
  belongs_to :atividade
  validates_presence_of :nm_motivo
end
