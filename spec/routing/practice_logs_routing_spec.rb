require "spec_helper"

describe PracticeLogsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/practice_logs" }.should route_to(:controller => "practice_logs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/practice_logs/new" }.should route_to(:controller => "practice_logs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/practice_logs/1" }.should route_to(:controller => "practice_logs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/practice_logs/1/edit" }.should route_to(:controller => "practice_logs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/practice_logs" }.should route_to(:controller => "practice_logs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/practice_logs/1" }.should route_to(:controller => "practice_logs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/practice_logs/1" }.should route_to(:controller => "practice_logs", :action => "destroy", :id => "1")
    end

  end
end
