class QualificacaosController < ApplicationController
  # GET /qualificacaos
  # GET /qualificacaos.xml
  def index
    @qualificacaos = Qualificacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @qualificacaos }
    end
  end

  # GET /qualificacaos/1
  # GET /qualificacaos/1.xml
  def show
    @qualificacao = Qualificacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @qualificacao }
    end
  end

  # GET /qualificacaos/new
  # GET /qualificacaos/new.xml
  def new
    @qualificacao = Qualificacao.new

   if params[:cliente]
	@qualificacao.cliente = Cliente.find(params[:cliente])
   end
   if params[:restaurante]
 	@qualificacao.restaurante = Restaurante.find(params[:restaurante])
   end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @qualificacao }
    end
  end

  # GET /qualificacaos/1/edit
  def edit
    @qualificacao = Qualificacao.find(params[:id])
  end

  # POST /qualificacaos
  # POST /qualificacaos.xml
  def create
    @qualificacao = Qualificacao.new(params[:qualificacao])

    respond_to do |format|
      if @qualificacao.save
        format.html { redirect_to(@qualificacao, :notice => 'Qualificacao was successfully created.') }
        format.xml  { render :xml => @qualificacao, :status => :created, :location => @qualificacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @qualificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /qualificacaos/1
  # PUT /qualificacaos/1.xml
  def update
    @qualificacao = Qualificacao.find(params[:id])

    respond_to do |format|
      if @qualificacao.update_attributes(params[:qualificacao])
        format.html { redirect_to(@qualificacao, :notice => 'Qualificacao was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @qualificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /qualificacaos/1
  # DELETE /qualificacaos/1.xml
  def destroy
    @qualificacao = Qualificacao.find(params[:id])
    @qualificacao.destroy

    respond_to do |format|
      format.html { redirect_to(qualificacaos_url) }
      format.xml  { head :ok }
    end
  end
end
