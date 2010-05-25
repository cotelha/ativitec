class Atividade < ActiveRecord::Base
  has_and_belongs_to_many :motivo_atividades
  validates_presence_of :nm_atividade, :tp_atividade  
end
