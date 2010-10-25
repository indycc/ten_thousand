require 'spec_helper'

describe "practice_logs/index.html.erb" do
  before(:each) do
    assign(:practice_logs, [
      stub_model(PracticeLog),
      stub_model(PracticeLog)
    ])
  end

  it "renders a list of practice_logs" do
    render
  end
end
