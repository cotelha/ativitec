class OsHistorico < ActiveRecord::Base

  set_primary_keys :dt_inicio, :user_id, :atividade_id

  belongs_to :orden_servico
  belongs_to :atividade
  belongs_to :user
end
