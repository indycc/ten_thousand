require 'spec_helper'

describe "practice_logs/new.html.erb" do
  before(:each) do
    assign(:practice_log, stub_model(PracticeLog).as_new_record)
  end

  it "renders new practice_log form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => practice_logs_path, :method => "post" do
    end
  end
end
