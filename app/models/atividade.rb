class Atividade < ActiveRecord::Base
  validates_presence_of :nm_atividade, :tp_atividade
  has_many :motivo_atividades
end
