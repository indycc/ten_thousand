class PracticeLogsController < ApplicationController
  require_user

  # GET /practice_logs
  # GET /practice_logs.xml
  def index
    @practice_logs = PracticeLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @practice_logs }
    end
  end

  # GET /practice_logs/1
  # GET /practice_logs/1.xml
  def show
    @practice_log = PracticeLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @practice_log }
    end
  end

  # GET /practice_logs/new
  # GET /practice_logs/new.xml
  def new
    @practice_log = PracticeLog.new
    @expertises = Expertise.all.collect{ |e| [e.name, e.id] }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @practice_log }
    end
  end

  # GET /practice_logs/1/edit
  def edit
    @practice_log = PracticeLog.find(params[:id])
    @expertises = Expertise.all.collect{ |e| [e.name, e.id] }
  end

  # POST /practice_logs
  # POST /practice_logs.xml
  def create
    @practice_log = PracticeLog.new(params[:practice_log])
    @practice_log.duration = fix_duration(params[:practice_log][:duration])
    @practice_log.user = current_user
    @practice_logs = PracticeLog.all
    
    respond_to do |format|
      if @practice_log.save
        format.html { redirect_to(params[:quick_add] ? :back : practice_logs_path, :notice => 'Practice log was successfully created.') }
        format.xml  { render :xml => practice_logs_path, :status => :created, :location => practice_logs_path }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @practice_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /practice_logs/1
  # PUT /practice_logs/1.xml
  def update
    @practice_log = PracticeLog.find(params[:id])
    # TODO : 
    #params[:practice_log][:duration] = fix_duration(params[:practice_log][:duration])

    respond_to do |format|
      if @practice_log.update_attributes(params[:practice_log])
        format.html { redirect_to(practice_logs_path, :notice => 'Practice log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @practice_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /practice_logs/1
  # DELETE /practice_logs/1.xml
  def destroy
    @practice_log = PracticeLog.find(params[:id])
    @practice_log.destroy

    respond_to do |format|
      format.html { redirect_to(practice_logs_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def fix_duration(time_formatted)
    if ((not time_formatted.nil?) and time_formatted.match(":") )
      match = time_formatted.match('(\d{1,2}):(\d{1,2})')
      hours_part = match[1].to_i * 60
      minutes_part = match[2].to_i
      hours_part + minutes_part
    else
       time_formatted.to_i
    end
  end
end
