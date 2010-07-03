class RelatoriosController < ApplicationController

  require 'will_paginate'
  layout "application", :except => [:show,:imprimir]

  def index    
  end

  def imprimir    
    sql="select
            u.login AS usuario,
            a.nm_atividade as atividade,
            h.orden_servico_id AS nr_os,
            sum((h.dt_termino-h.dt_inicio)) AS tempo,
            (CASE
              WHEN (os.ind_status='A') THEN 'EM ABERTO'
              WHEN (os.ind_status='C') THEN 'CONCLUIDO'
              WHEN (os.ind_status='E') THEN 'EM USO'
              WHEN (os.ind_status='R') THEN 'CANCELADA'
            END) AS status,
            os.txt_descricao

          from os_historicos h

          left join orden_servicos os ON
          os.id = h.orden_servico_id

          left join users u ON
          u.id = os.user_id

          left join atividades a ON
          a.id = os.atividade_id

          where os.dt_inicio BETWEEN '"+params["data_ini"].to_s+"' AND '"+params["data_fim"].to_s+"'"
    
            if (params["usuario_id"].to_s!="") then
              sql << " AND os.user_id = "+params["usuario_id"].to_s
            end
            if (params["cliente_id"].to_s!="") then
              sql << " AND os.cliente_id = "+params["cliente_id"].to_s
            end
            if (params["projeto_id"].to_s!="") then
              sql << " AND os.projeto_id = "+params["projeto_id"].to_s
            end
          sql << " group by os.dt_inicio, h.orden_servico_id, os.ind_status, u.login, os.txt_descricao, a.nm_atividade
                    ORDER BY os.dt_inicio DESC"

    @relatorios = Relatorio.find_by_sql(sql)

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
              WHEN (os.ind_status='R') THEN 'CANCELADA'              
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
            if (params[:relatorio][:usuario_id]!="") then
              sql << " AND os.user_id = "+params[:relatorio][:usuario_id]
            end
            if (params[:relatorio][:cliente_id]!="") then
              sql << " AND os.cliente_id = "+params[:relatorio][:cliente_id]
            end
            if (params[:relatorio][:projeto_id]!="") then
              sql << " AND os.projeto_id = "+params[:relatorio][:projeto_id]
            end
          sql << "group by h.orden_servico_id, os.ind_status, u.login, os.txt_descricao, a.nm_atividade"
    
    @relatorios = Relatorio.paginate_by_sql(sql, :page=>params[:page], :per_page=>"50", :order => 'os.dt_inicio DESC')
    
  end

end
