class ExpertisesController < ApplicationController
  # GET /expertises
  # GET /expertises.xml
  def index
    @expertises = Expertise.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @expertises }
    end
  end

  # GET /expertises/1
  # GET /expertises/1.xml
  def show
    @expertise = Expertise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @expertise }
    end
  end

  # GET /expertises/new
  # GET /expertises/new.xml
  def new
    @expertise = Expertise.new


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @expertise }
    end
  end

  # GET /expertises/1/edit
  def edit
    @expertise = Expertise.find(params[:id])
  end

  # POST /expertises
  # POST /expertises.xml
  def create
    @expertise = Expertise.new(params[:expertise])

    respond_to do |format|
      if @expertise.save
        format.html { redirect_to(@expertise, :notice => 'Expertise was successfully created.') }
        format.xml  { render :xml => @expertise, :status => :created, :location => @expertise }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @expertise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /expertises/1
  # PUT /expertises/1.xml
  def update
    @expertise = Expertise.find(params[:id])

    respond_to do |format|
      if @expertise.update_attributes(params[:expertise])
        format.html { redirect_to(@expertise, :notice => 'Expertise was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @expertise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /expertises/1
  # DELETE /expertises/1.xml
  def destroy
    @expertise = Expertise.find(params[:id])
    @expertise.destroy

    respond_to do |format|
      format.html { redirect_to(expertises_url) }
      format.xml  { head :ok }
    end
  end
end
