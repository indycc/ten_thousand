require 'spec_helper'

describe ExpertisesController do
  def mock_expertise(stubs={})
    (@mock_expertise ||= mock_model(Expertise).as_null_object).tap do |expertise|
      expertise.stub(stubs) unless stubs.empty?
    end
  end
  def mock_user(stubs={})
    (@mock_user ||= mock_model(User).as_null_object).tap do |user|
      user.stub(stubs) unless stubs.empty?
    end
  end
  def sign_in!
    @mock_user = User.create!
    session[:user_id] = @mock_user.id
#    User.stub(:find).with('signed_in_user') { mock_user }
#    session[:user_id] = 'signed_in_user'
  end

  before(:each) do
    sign_in!
  end

  it "GET index" do
    Expertise.stub(:all) { [mock_expertise] }
    get :index
    assigns(:expertises).should eq([mock_expertise])
  end

  it "GET show" do
    Expertise.stub(:find).with('42') { mock_expertise }
    get :show, :id => '42'
    assigns(:expertise).should be(mock_expertise)
  end

  describe "GET new" do
    it "assigns a new expertise" do
      Expertise.stub(:new) { mock_expertise }
      get :new
      assigns(:expertise).should be(mock_expertise)
    end
  end

  describe "GET edit" do
    it "loads the expertise" do
      Expertise.stub(:find).with('42') { mock_expertise }
      get :edit, :id => '42'
      assigns(:expertise).should be(mock_expertise)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created expertise as @expertise" do
        Expertise.stub(:new).with({'these' => 'params'}) { mock_expertise(:save => true) }
        post :create, :expertise => {'these' => 'params'}
        assigns(:expertise).should be(mock_expertise)
      end

      it "redirects to the created expertise" do
        Expertise.stub(:new) { mock_expertise(:save => true) }
        post :create, :expertise => {}
        response.should redirect_to(expertises_url())
      end
      
      it "adds the current user to the expertise" do
        Expertise.stub(:new) { mock_expertise(:save => true) }
        mock_expertise.expect('user_id=', mock_user.id)
        post :create, :expertise => {}
        assigns(:expertise).should be(mock_expertise)
      end
      
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved expertise as @expertise" do
        Expertise.stub(:new).with({'these' => 'params'}) { mock_expertise(:save => false) }
        post :create, :expertise => {'these' => 'params'}
        assigns(:expertise).should be(mock_expertise)
      end

      it "re-renders the 'new' template" do
        Expertise.stub(:new) { mock_expertise(:save => false) }
        post :create, :expertise => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested expertise" do
        Expertise.should_receive(:find).with("37") { mock_expertise }
        mock_expertise.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :expertise => {'these' => 'params'}
      end

      it "assigns the requested expertise as @expertise" do
        Expertise.stub(:find) { mock_expertise(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:expertise).should be(mock_expertise)
      end

      it "redirects to the expertise" do
        Expertise.stub(:find) { mock_expertise(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(expertises_url())
      end
    end

    describe "with invalid params" do
      it "assigns the expertise as @expertise" do
        Expertise.stub(:find) { mock_expertise(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:expertise).should be(mock_expertise)
      end

      it "re-renders the 'edit' template" do
        Expertise.stub(:find) { mock_expertise(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested expertise" do
      Expertise.should_receive(:find).with("37") { mock_expertise }
      mock_expertise.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the expertises list" do
      Expertise.stub(:find) { mock_expertise }
      delete :destroy, :id => "1"
      response.should redirect_to(expertises_url)
    end
  end
end
