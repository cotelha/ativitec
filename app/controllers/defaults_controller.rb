class DefaultsController < ApplicationController
  before_filter :login_required
  
  def index
    @atividades = Atividade.find(:all, :order=>"nr_ordem asc")
    @execucao_orden_servicos = OrdenServico.find(:all, :conditions=>{:ind_status=>"E"})
  end

end
