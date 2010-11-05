require 'spec_helper'

describe PracticeLogsController do

  def mock_practice_log(stubs={})
    (@mock_practice_log ||= mock_model(PracticeLog).as_null_object).tap do |practice_log|
      practice_log.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all practice_logs as @practice_logs" do
      PracticeLog.stub(:all) { [mock_practice_log] }
      get :index
      assigns(:practice_logs).should eq([mock_practice_log])
    end
  end

  describe "GET show" do
    it "assigns the requested practice_log as @practice_log" do
      PracticeLog.stub(:find).with("37") { mock_practice_log }
      get :show, :id => "37"
      assigns(:practice_log).should be(mock_practice_log)
    end
  end

  describe "GET new" do
    it "assigns a new practice_log as @practice_log" do
      PracticeLog.stub(:new) { mock_practice_log }
      get :new
      assigns(:practice_log).should be(mock_practice_log)
    end
    
    it "assigns a new list of expertises  as @expertises" do
        def mock_expertises(stubs={})
          @mock_expertises ||= mock_model(Expertise).as_null_object.tap { |expertise| expertise.stub(stubs) unless stubs.empty?}
        end
      Expertise.stub(:all) { mock_expertises }
      get :new
      assigns(:expertises).first.should be(mock_expertises.first)
    end
  end

  describe "GET edit" do
    it "assigns the requested practice_log as @practice_log" do
      PracticeLog.stub(:find).with("37") { mock_practice_log }
      get :edit, :id => "37"
      assigns(:practice_log).should be(mock_practice_log)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created practice_log as @practice_log" do
        PracticeLog.stub(:new).with({'these' => 'params'}) { mock_practice_log(:save => true) }
        post :create, :practice_log => {'these' => 'params'}
        assigns(:practice_log).should be(mock_practice_log)
      end

      it "redirects to the created practice_log" do
        PracticeLog.stub(:new) { mock_practice_log(:save => true) }
        post :create, :practice_log => {}
        response.should redirect_to(practice_log_url(mock_practice_log))
      end
      
      it "adds the current user to the practice_log" do
        pending
      end
      
      it "creates using minutes as the default unit of measure" do
        post :create, :practice_log => {:expertise_id => 1, :duration => "15", :occurred_on => "10/10/2010"}
        assigns(:practice_log).duration.should be(15)
      end
      
      it "handles hours with colons" do
        post :create, :practice_log => {:expertise_id => 1, :duration => "1:15", :occurred_on => "10/10/2010"}
        assigns(:practice_log).duration.should be(75)
      end
      
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved practice_log as @practice_log" do
        PracticeLog.stub(:new).with({'these' => 'params'}) { mock_practice_log(:save => false) }
        post :create, :practice_log => {'these' => 'params'}
        assigns(:practice_log).should be(mock_practice_log)
      end

      it "re-renders the 'new' template" do
        PracticeLog.stub(:new) { mock_practice_log(:save => false) }
        post :create, :practice_log => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested practice_log" do
        PracticeLog.should_receive(:find).with("37") { mock_practice_log }
        mock_practice_log.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :practice_log => {'these' => 'params'}
      end

      it "assigns the requested practice_log as @practice_log" do
        PracticeLog.stub(:find) { mock_practice_log(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:practice_log).should be(mock_practice_log)
      end

      it "redirects to the practice_log" do
        PracticeLog.stub(:find) { mock_practice_log(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(practice_log_url(mock_practice_log))
      end
    end

    describe "with invalid params" do
      it "assigns the practice_log as @practice_log" do
        PracticeLog.stub(:find) { mock_practice_log(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:practice_log).should be(mock_practice_log)
      end

      it "re-renders the 'edit' template" do
        PracticeLog.stub(:find) { mock_practice_log(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested practice_log" do
      PracticeLog.should_receive(:find).with("37") { mock_practice_log }
      mock_practice_log.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the practice_logs list" do
      PracticeLog.stub(:find) { mock_practice_log }
      delete :destroy, :id => "1"
      response.should redirect_to(practice_logs_url)
    end
  end

end
