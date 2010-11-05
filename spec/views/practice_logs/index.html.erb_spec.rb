require 'spec_helper'

describe "practice_logs/index.html.erb" do
  before(:each) do
    exp = stub_model(Expertise)
    pl1 = stub_model(PracticeLog, :expertise => exp)
    pl2 = stub_model(PracticeLog, :expertise => exp)
        
    assign(:practice_logs, [ pl1,pl2 ])
  end

  it "renders a list of practice_logs" do
    render
  end
end
