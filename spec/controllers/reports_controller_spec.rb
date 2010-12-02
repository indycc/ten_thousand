require 'spec_helper'

describe ReportsController do

  describe "GET 'calendar'" do
    it "should be successful" do
      get 'calendar'
      response.should be_success
    end
  end

end
