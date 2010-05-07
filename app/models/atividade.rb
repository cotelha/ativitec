class Atividade < ActiveRecord::Base
  validates_presence_of :nm_atividade, :tp_atividade
end
