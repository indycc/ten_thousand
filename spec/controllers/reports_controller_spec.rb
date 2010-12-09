require 'spec_helper'

describe ReportsController do
  
  before(:each) do
    u = User.new()
    u.id = 23
    session[:user_id] = u.id
    User.stub(:find).and_return(u)
    User.stub(:find_by_id).and_return(u)
  end
  
  describe "GET 'calendar'" do
    it "should be successful" do
      get 'calendar'
      response.should be_success
    end
  end

end
