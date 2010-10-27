require 'spec_helper'

describe "practice_logs/edit.html.erb" do
  before(:each) do
    @practice_log = assign(:practice_log, stub_model(PracticeLog,
      :new_record? => false
    ))
  end

  it "renders the edit practice_log form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => practice_log_path(@practice_log), :method => "post" do
    end
  end
end
