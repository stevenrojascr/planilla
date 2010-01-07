class AusenciasController < ApplicationController
  # GET /ausencias
  # GET /ausencias.xml
  def index
    @ausencias = Ausencia.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ausencias }
    end
  end

  # GET /ausencias/1
  # GET /ausencias/1.xml
  def show
    @ausencia = Ausencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ausencia }
    end
  end

  # GET /ausencias/new
  # GET /ausencias/new.xml
  def new
    @ausencia = Ausencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ausencia }
    end
  end

  # GET /ausencias/1/edit
  def edit
    @ausencia = Ausencia.find(params[:id])
  end

  # POST /ausencias
  # POST /ausencias.xml
  def create
    @ausencia = Ausencia.new(params[:ausencia])

    respond_to do |format|
      if @ausencia.save
        flash[:notice] = 'Ausencia was successfully created.'
        format.html { redirect_to(@ausencia) }
        format.xml  { render :xml => @ausencia, :status => :created, :location => @ausencia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ausencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ausencias/1
  # PUT /ausencias/1.xml
  def update
    @ausencia = Ausencia.find(params[:id])

    respond_to do |format|
      if @ausencia.update_attributes(params[:ausencia])
        flash[:notice] = 'Ausencia was successfully updated.'
        format.html { redirect_to(@ausencia) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ausencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ausencias/1
  # DELETE /ausencias/1.xml
  def destroy
    @ausencia = Ausencia.find(params[:id])
    @ausencia.destroy

    respond_to do |format|
      format.html { redirect_to(ausencias_url) }
      format.xml  { head :ok }
    end
  end
end
