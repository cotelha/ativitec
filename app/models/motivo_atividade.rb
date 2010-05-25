class MotivoAtividade < ActiveRecord::Base
  has_and_belongs_to_many :atividades
  validates_presence_of :nm_motivo
end
