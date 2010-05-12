class OrdenServicosController < ApplicationController
  # GET /orden_servicos
  # GET /orden_servicos.xml
  before_filter :login_required
  
  def index
    @orden_servicos = OrdenServico.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orden_servicos }
    end
  end

  # GET /orden_servicos/1
  # GET /orden_servicos/1.xml
  def show
    @orden_servico = OrdenServico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @orden_servico }
    end
  end

  # GET /orden_servicos/new
  # GET /orden_servicos/new.xml
  def new
    @orden_servico = OrdenServico.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @orden_servico }
    end
  end

  # GET /orden_servicos/1/edit
  def edit
    @orden_servico = OrdenServico.find(params[:id])
  end

  # POST /orden_servicos
  # POST /orden_servicos.xml
  def create
    @orden_servico = OrdenServico.new(params[:orden_servico])

    respond_to do |format|
      if @orden_servico.save
        flash[:notice] = 'OrdenServico was successfully created.'
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

    respond_to do |format|
      if @orden_servico.update_attributes(params[:orden_servico])
        flash[:notice] = 'OrdenServico was successfully updated.'
        format.html { redirect_to(@orden_servico) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
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
