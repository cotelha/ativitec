class RelatoriosController < ApplicationController

  require 'will_paginate'

  def index
  end

  def show
    sql="select h.orden_servico_id, h.dt_inicio, h.dt_termino, os.txt_descricao from os_historicos h
            left join orden_servicos os on os.id = h.orden_servico_id;"
    @relatorios = Relatorio.paginate_by_sql(sql, :page=>params[:page], :per_page=>50)
    #:page => params[:page], :order => 'dt_inicio DESC'
  end

end
