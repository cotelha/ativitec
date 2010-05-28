class OrdenServicosController < ApplicationController
  # GET /orden_servicos
  # GET /orden_servicos.xml
  before_filter :login_required  

  def index
    @orden_servicos = OrdenServico.find(:all, :conditions=>{:ind_status=>"A", :user_id=>current_user.id}, :order=>"nro_prioridade DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orden_servicos }
    end
  end

  # GET /orden_servicos/1
  # GET /orden_servicos/1.xml
  def show
    @orden_servico = OrdenServico.find(params[:id])
    @atividade = Atividade.find_by_id(@orden_servico.atividade_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @orden_servico }
    end
  end

  # GET /orden_servicos/new
  # GET /orden_servicos/new.xml
  def new    
    @orden_servico = OrdenServico.new    
    @atividade = Atividade.find_by_id(params[:cod_atividade])
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @orden_servico }
    end
  end

  # GET /orden_servicos/1/edit
  def edit
    @orden_servico = OrdenServico.find(params[:id])
    @atividade = Atividade.find_by_id(@orden_servico.atividade_id)
  end

  # POST /orden_servicos
  # POST /orden_servicos.xml
  def create
    @atividade = Atividade.find_by_id(params[:orden_servico][:atividade_id])    

    if @atividade.tp_atividade=="I" then
      params[:orden_servico][:dt_inicio] = Time.now.strftime("%Y-%m-%d %H:%M:%S").to_s
      params[:orden_servico][:ind_status] = "A"
    elsif @atividade.tp_atividade=="E" then
      #se for atividade extena
      params[:orden_servico][:dt_inicio] = ("#{params[:data].gsub("/","-")} #{params[:hora_inicio]}:00").to_datetime.strftime("%Y-%m-%d %H:%M:%S").to_s
      params[:orden_servico][:dt_termino] = "#{params[:data].gsub("/","-")} #{params[:hora_fim]}:00".to_datetime.strftime("%Y-%m-%d %H:%M:%S").to_s
      params[:orden_servico][:ind_status] = "C"
    end        

    @orden_servico = OrdenServico.new(params[:orden_servico])

    respond_to do |format|
      if @orden_servico.save

        if @atividade.tp_atividade=="E" then
          @orden_servico.os_historicos.create(:user_id => current_user.id, :dt_inicio => params[:orden_servico][:dt_inicio], :dt_termino => params[:orden_servico][:dt_termino])
        end
        
        #flash[:notice] = 'OrdenServico was successfully created.'
        format.html { redirect_to(@orden_servico) }
        format.xml  { render :xml => @orden_servico, :status => :created, :location => @orden_servico }        
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @orden_servico.errors, :status => :unprocessable_entity }        
      end
    end

  end

  # PUT /orden_servicos/1
  # PUT /orden_servicos/1.xml
  def update
    @orden_servico = OrdenServico.find(params[:id])
    @atividade = Atividade.find_by_id(@orden_servico.atividade_id)
    
    respond_to do |format|
      if @orden_servico.update_attributes(params[:orden_servico])        
        #flash[:notice] = 'OrdenServico was successfully updated.'
        format.html { redirect_to(@orden_servico) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @orden_servico.errors, :status => :unprocessable_entity }
      end
    end
  end

  def iniciar
    @orden_servico = OrdenServico.find(params[:id])
    @orden_servico.os_historicos.create(:user_id => current_user.id, :dt_inicio => Time.now.strftime("%d-%m-%Y %H:%M:%S"))

    respond_to do |format|
      if @orden_servico.update_attribute('ind_status','E')
        flash[:notice] = 'Orden Servico iniciada.'
        format.html { redirect_to defaults_path }
        format.xml  { head :ok }
      else
        format.html { redirect_to defaults_path }
        format.xml  { render :xml => @orden_servico.errors, :status => :unprocessable_entity }
      end
    end
  end

  def concluir
    @orden_servico = OrdenServico.find(params[:id])
    b=@orden_servico.os_historicos.find(:first, :conditions => {:dt_termino => nil})
    b.update_attribute("dt_termino",Time.now.strftime("%d-%m-%Y %H:%M:%S"))

    @orden_servico.dt_termino = Time.now.strftime("%d-%m-%Y %H:%M:%S")
    
    respond_to do |format|
      if @orden_servico.update_attribute('ind_status','C')
        flash[:notice] = 'Orden Servico concluida.'
        format.html { redirect_to defaults_path }
        format.xml  { head :ok }
      else
        format.html { redirect_to defaults_path }
        format.xml  { render :xml => @orden_servico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orden_servicos/1
  # PUT /orden_servicos/1.xml
  def parar
    @orden_servico = OrdenServico.find(params[:id])
    b=@orden_servico.os_historicos.find(:first, :conditions => {:dt_termino => nil})    
    b.update_attribute("dt_termino",Time.now.strftime("%d-%m-%Y %H:%M:%S"))

    respond_to do |format|
      if @orden_servico.update_attribute('ind_status','A')
        flash[:notice] = 'Orden Servico parada.'
        format.html { redirect_to defaults_path }
        format.xml  { head :ok }
      else
        format.html { redirect_to defaults_path }
        format.xml  { render :xml => @orden_servico.errors, :status => :unprocessable_entity }
      end
    end
  end

  def diminuir_prioridade
    @orden_servico = OrdenServico.find(params[:id])
    if @orden_servico.nro_prioridade.to_i>0 then
      nr = @orden_servico.nro_prioridade.to_i-1
    else
      nr = @orden_servico.nro_prioridade.to_i
    end

    respond_to do |format|
      if @orden_servico.update_attribute('nro_prioridade',nr)
        #flash[:notice] = 'Orden Servico parada.'
        format.html { redirect_to orden_servicos_path }
        format.xml  { head :ok }
      else
        format.html { redirect_to orden_servicos_path }
        format.xml  { render :xml => @orden_servico.errors, :status => :unprocessable_entity }
      end
    end
  end

  def aumentar_prioridade
    @orden_servico = OrdenServico.find(params[:id])
    if @orden_servico.nro_prioridade.to_i<10 then
      nr = @orden_servico.nro_prioridade.to_i+1
    else
      nr = @orden_servico.nro_prioridade.to_i
    end
    
    respond_to do |format|
      if @orden_servico.update_attribute('nro_prioridade',nr)
        #flash[:notice] = 'Orden Servico parada.'
        format.html { redirect_to orden_servicos_path }
        format.xml  { head :ok }
      else
        format.html { redirect_to orden_servicos_path }
        format.xml  { render :xml => @orden_servico.errors, :status => :unprocessable_entity }
      end
    end
  end

  def cancelar
    @orden_servico = OrdenServico.find(params[:id])
    respond_to do |format|
      if @orden_servico.update_attribute('ind_status','C')
        #flash[:notice] = 'Orden Servico parada.'
        format.html { redirect_to orden_servicos_path }
        format.xml  { head :ok }
      else
        format.html { redirect_to orden_servicos_path }
        format.xml  { render :xml => @orden_servico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_servicos/1
  # DELETE /orden_servicos/1.xml
  def destroy
    @orden_servico = OrdenServico.find(params[:id])
    @orden_servico.destroy

    respond_to do |format|
      format.html { redirect_to(orden_servicos_url) }
      format.xml  { head :ok }
    end
  end
    
end
