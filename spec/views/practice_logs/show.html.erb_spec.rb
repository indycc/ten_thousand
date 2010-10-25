require 'spec_helper'

describe "practice_logs/show.html.erb" do
  before(:each) do
    @practice_log = assign(:practice_log, stub_model(PracticeLog))
  end

  it "renders attributes in <p>" do
    render
  end
end
