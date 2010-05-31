class RelatoriosController < ApplicationController

  require 'will_paginate'

  def index
  end

  def show
    sql="select
            u.login AS usuario,
            a.nm_atividade as atividade,
            h.orden_servico_id AS nr_os,
            sum((h.dt_termino-h.dt_inicio)) AS tempo,
            (CASE
              WHEN (os.ind_status='A') THEN 'EM ABERTO'
              WHEN (os.ind_status='C') THEN 'CONCLUIDO'
              WHEN (os.ind_status='E') THEN 'EM USO'
              ELSE ''
            END) AS status,
            os.txt_descricao

          from os_historicos h

          left join orden_servicos os ON
          os.id = h.orden_servico_id

          left join users u ON
          u.id = os.user_id

          left join atividades a ON
          a.id = os.atividade_id

          where os.dt_inicio BETWEEN '"+params[:data_ini]+"' AND '"+params[:data_fim]+"'"
            if (params[:usuario]!="") then
              sql << "AND upper(u.name) like upper('%"+params[:usuario]+"%')"
            end
          sql << "group by h.orden_servico_id, os.ind_status, u.login, os.txt_descricao, a.nm_atividade"
    
    @relatorios = Relatorio.paginate_by_sql(sql, :page=>params[:page], :per_page=>"10", :order => 'os.dt_inicio DESC')
    
  end

end
