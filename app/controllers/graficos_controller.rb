class GraficosController < ApplicationController
  def index
  end

  def show

     if params[:tp_rel]=="relAtividade" then
        sql="select            
            a.nm_atividade as atividade,            
            sum((h.dt_termino-h.dt_inicio)) AS tempo            

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
          sql << "group by a.nm_atividade"
    end

    @rel = Grafico.find_by_sql(sql)
     respond_to do |format|
        format.html # index.html.erb
    end

  end

end
