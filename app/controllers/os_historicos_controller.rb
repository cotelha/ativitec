class OsHistoricosController < ApplicationController
  # GET /orden_servicos
  # GET /orden_servicos.xml
  before_filter :login_required

  def show
    @atividade = Atividade.find_by_id(params[:id].split(",")[2])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @os_historico }
    end
  end

  # GET /orden_servicos/new
  # GET /orden_servicos/new.xml
  def new
    @os_historico = OsHistorico.new    

    respond_to do |format|
      format.html # new.html.erb      
    end
  end

  # POST /orden_servicos
  # POST /orden_servicos.xml
  def create
    # para os que estao em execucao
    @orden_servicos = OrdenServico.find(:all, :conditions => {:ind_status => "E", :user_id=>current_user.id}, :select=>"id")
    @orden_servicos.each do |x|
     b=OsHistorico.find_by_orden_servico_id(x.id, :conditions => {:dt_termino => nil})
     b.update_attribute("dt_termino",Time.now.strftime("%d-%m-%Y %H:%M:%S"))
    end

      params[:os_historico][:dt_inicio] = Time.now.strftime("%Y-%m-%d %H:%M:%S").to_s
      params[:os_historico][:user_id] = current_user.id

    @os_historico = OsHistorico.new(params[:os_historico])

    respond_to do |format|
      if @os_historico.save
        #flash[:notice] = 'OrdenServico was successfully created.'
        format.html { redirect_to(@os_historico) }
        format.xml  { render :xml => @os_historico, :status => :created, :location => @os_historico }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @os_historico.errors, :status => :unprocessable_entity }
      end
    end
  end

    # PUT /orden_servicos/1
  # PUT /orden_servicos/1.xml
  def parar    
    @os_historico = OsHistorico.find(:first, :conditions => {:dt_termino => nil, :user_id=>current_user.id})         

    # inicia os que estavam em execucao
    @orden_servicos = OrdenServico.find(:all, :conditions => {:ind_status => "E", :user_id=>current_user.id}, :select=>"id")
    @orden_servicos.each do |x|     
     OsHistorico.create(:orden_servico_id=>x.id, :user_id => current_user.id, :dt_inicio => Time.now.strftime("%d-%m-%Y %H:%M:%S"))
    end

    respond_to do |format|
      if @os_historico.update_attribute("dt_termino",Time.now.strftime("%d-%m-%Y %H:%M:%S"))
        flash[:notice] = 'Atividade parada.'
        format.html { redirect_to defaults_path }
        format.xml  { render :xml => @os_historico, :status => :created, :location => @os_historico }
      else
        format.html { redirect_to defaults_path }
        format.xml  { render :xml => @os_historico.errors, :status => :unprocessable_entity }
      end
    end
  end

end
