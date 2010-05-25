class AtividadesController < ApplicationController
  # GET /atividades
  # GET /atividades.xml
  before_filter :login_required
  before_filter :find_motivo_atividades, :only => [:new, :edit, :update, :create, :show, :index]
  
  def index
    @atividades = Atividade.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @atividades }
    end
  end

  # GET /atividades/1
  # GET /atividades/1.xml
  def show
    @atividade = Atividade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @atividade }
    end
  end

  # GET /atividades/new
  # GET /atividades/new.xml
  def new
    @atividade = Atividade.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @atividade }
    end
  end

  # GET /atividades/1/edit
  def edit
    @atividade = Atividade.find(params[:id])
  end

  # POST /atividades
  # POST /atividades.xml
  def create
    @atividade = Atividade.new(params[:atividade])

    #Atualiza motivo de atividades
    if params.has_key?(:motivo_atividades) then
      @atividade.motivo_atividades = []
      params[:motivo_atividades].each {|g|
        gr = MotivoAtividade.find(g)
        @atividade.motivo_atividades << gr unless @atividade.motivo_atividades.include?(gr)
      }
    else
      @atividade.atividades = []
    end

    respond_to do |format|
      if @atividade.save
        flash[:notice] = 'Atividade cadastrada com sucesso.'
        format.html { redirect_to(@atividade) }
        format.xml  { render :xml => @atividade, :status => :created, :location => @atividade }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @atividade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /atividades/1
  # PUT /atividades/1.xml
  def update
    @atividade = Atividade.find(params[:id])

    #Atualiza motivo de atividades
    if params.has_key?(:motivo_atividades) then
      @atividade.motivo_atividades = []
      params[:motivo_atividades].each {|g|
        gr = MotivoAtividade.find(g)
        @atividade.motivo_atividades << gr unless @atividade.motivo_atividades.include?(gr)
      }
    else
      @atividade.atividades = []
    end

    respond_to do |format|
      if @atividade.update_attributes(params[:atividade])
        flash[:notice] = 'Atividade atualizada com sucesso.'
        format.html { redirect_to(@atividade) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @atividade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1
  # DELETE /atividades/1.xml
  def destroy
    @atividade = Atividade.find(params[:id])
    @atividade.destroy

    respond_to do |format|
      format.html { redirect_to(atividades_url) }
      format.xml  { head :ok }
    end
  end

  private
  def find_motivo_atividades
    @motivo_atividades = MotivoAtividade.find(:all)
  end
end
