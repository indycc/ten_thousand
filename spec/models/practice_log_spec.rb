require 'spec_helper'

describe PracticeLog do
  before(:each) do
    @p_log = PracticeLog.new
    @user = User.new
    @p_log.user = @user
  end
  it "should understand users" do
    @p_log.user.should_not be_nil
  end
end
