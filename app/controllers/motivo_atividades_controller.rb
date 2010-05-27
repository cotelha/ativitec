class MotivoAtividadesController < ApplicationController
  # GET /motivo_atividades
  # GET /motivo_atividades.xml
  before_filter :login_required
  before_filter :find_atividades, :only => [:new, :edit, :update, :create, :show, :index]
  
  def index
    @motivo_atividades = MotivoAtividade.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @motivo_atividades }
    end
  end

  # GET /motivo_atividades/1
  # GET /motivo_atividades/1.xml
  def show
    @motivo_atividade = MotivoAtividade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @motivo_atividade }
    end
  end

  # GET /motivo_atividades/new
  # GET /motivo_atividades/new.xml
  def new
    @motivo_atividade = MotivoAtividade.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @motivo_atividade }
    end
  end

  # GET /motivo_atividades/1/edit
  def edit
    @motivo_atividade = MotivoAtividade.find(params[:id])
  end

  # POST /motivo_atividades
  # POST /motivo_atividades.xml
  def create    
    @motivo_atividade = MotivoAtividade.new(params[:motivo_atividade])

    #Atualiza atividades
    if params.has_key?(:atividades) then
      @motivo_atividade.atividades = []
      params[:atividades].each {|g|
        gr = Atividade.find(g)
        @motivo_atividade.atividades << gr unless @motivo_atividade.atividades.include?(gr)
      }
    else
      begin
        @motivo_atividade.atividades = []
      rescue
        ""
      end
    end

    respond_to do |format|
      if @motivo_atividade.save
        flash[:notice] = 'Motivo de Atividade cadastrada com sucesso.'
        format.html { redirect_to(@motivo_atividade) }
        format.xml  { render :xml => @motivo_atividade, :status => :created, :location => @motivo_atividade }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @motivo_atividade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /motivo_atividades/1
  # PUT /motivo_atividades/1.xml
  def update
    @motivo_atividade = MotivoAtividade.find(params[:id])

    #Atualiza atividades
    if params.has_key?(:atividades) then
      @motivo_atividade.atividades = []
      params[:atividades].each {|g|
        gr = Atividade.find(g)
        @motivo_atividade.atividades << gr unless @motivo_atividade.atividades.include?(gr)
      }
    else
      begin
        @motivo_atividade.atividades = []
      rescue
        ""
      end
    end
    
    respond_to do |format|
      if @motivo_atividade.update_attributes(params[:motivo_atividade])        
        
        flash[:notice] = 'Motivo de Atividade atualizada com sucesso.'
        format.html { redirect_to(@motivo_atividade) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @motivo_atividade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /motivo_atividades/1
  # DELETE /motivo_atividades/1.xml
  def destroy
    @motivo_atividade = MotivoAtividade.find(params[:id])
    @motivo_atividade.destroy

    respond_to do |format|
      format.html { redirect_to(motivo_atividades_url) }
      format.xml  { head :ok }
    end
  end

  private
  def find_atividades
    @atividades = Atividade.find(:all)
  end
end
