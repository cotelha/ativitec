class GraficosController < ApplicationController

  layout "application", :except => :show
    
  def index
  end

  def show
    if params[:tp_rel]=="relUsuario" then
      sql="select
           u.login as nome,
           sum((h.dt_termino-h.dt_inicio)) AS tempo

           from os_historicos h

           left join orden_servicos os ON
           os.id = h.orden_servico_id

           left join users u ON
           u.id = os.user_id           

           where os.dt_inicio BETWEEN '"+params[:data_ini]+"' AND '"+params[:data_fim]+"'"
            if (params[:relatorio][:usuario_id]!="") then
              sql << " AND os.user_id = "+params[:relatorio][:usuario_id]
            end
            if (params[:relatorio][:cliente_id]!="") then
              sql << " AND os.cliente_id = "+params[:relatorio][:cliente_id]
            end
        sql << " group by u.login"
    end

    if params[:tp_rel]=="relMotivoAtividade" then
      sql="select
           a.nm_motivo as nome,
           sum((h.dt_termino-h.dt_inicio)) AS tempo

           from os_historicos h

           left join orden_servicos os ON
           os.id = h.orden_servico_id

           left join users u ON
           u.id = os.user_id

           left join motivo_atividades a ON
           a.id = os.motivo_atividade_id

           where os.dt_inicio BETWEEN '"+params[:data_ini]+"' AND '"+params[:data_fim]+"'"
            if (params[:relatorio][:usuario_id]!="") then
              sql << " AND os.user_id = "+params[:relatorio][:usuario_id]
            end
            if (params[:relatorio][:cliente_id]!="") then
              sql << " AND os.cliente_id = "+params[:relatorio][:cliente_id]
            end
        sql << " group by a.nm_motivo"
    end

     if params[:tp_rel]=="relAtividade" then
        sql="select            
            a.nm_atividade as nome,
            sum((h.dt_termino-h.dt_inicio)) AS tempo            

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
          sql << " group by a.nm_atividade"
    end

    @rel = Grafico.find_by_sql(sql)
     respond_to do |format|
        format.html # index.html.erb
    end
  end

end
