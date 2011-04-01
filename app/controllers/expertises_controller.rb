class ExpertisesController < ApplicationController
  require_user

  # GET /expertises
  # GET /expertises.xml
  def index
    @expertises = current_user.expertises.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @expertises }
      format.js   { render :json => @expertises.collect(&:to_sparkline) }
    end
  end

  # GET /expertises/1
  # GET /expertises/1.xml
  def show
    @expertise = current_user.expertises.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @expertise }
    end
  end

  # GET /expertises/new
  # GET /expertises/new.xml
  def new
    @expertise = current_user.expertises.build
    @expertise.color = Expertise.pick_default_color_for(current_user)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @expertise }
    end
  end

  # GET /expertises/1/edit
  def edit
    @expertise = current_user.expertises.find(params[:id])
  end

  # POST /expertises
  # POST /expertises.xml
  def create
    @expertise = current_user.expertises.build(params[:expertise])
    @expertise.user = current_user

    respond_to do |format|
      if @expertise.save
        format.html { redirect_to(expertises_path, :notice => t('ccicc.created', :model => Expertise.model_name.human)) }
        format.xml  { render :xml => expertises_path, :status => :created, :location => expertises_path }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @expertise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /expertises/1
  # PUT /expertises/1.xml
  def update
    @expertise = current_user.expertises.find(params[:id])
    @expertise.user ||= current_user

    respond_to do |format|
      if @expertise.update_attributes(params[:expertise])
        format.html { redirect_to(expertises_path, :notice => t('ccicc.updated', :model => Expertise.model_name.human)) }
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
    @expertise = current_user.expertises.find(params[:id])
    @expertise.destroy

    respond_to do |format|
      format.html { redirect_to(expertises_url) }
      format.xml  { head :ok }
    end
  end
end
