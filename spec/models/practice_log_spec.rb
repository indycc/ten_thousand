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
  context "PracticeDuration" do
    context "With Hour" do
      before (:each) do
        @p_log.duration = 75
      end
      it "should display as 1:15" do
        @p_log.practice_duration.should == "1:15"
      end
      it "should accept 1:30 as 90 minutes" do
        @p_log.practice_duration = "1:30"
        @p_log.duration.should == 90
      end
    end
    context "Without Hour" do
      before(:each) do
        @p_log.duration = 45
      end
      it "should display as 45" do
        @p_log.practice_duration.should == "45"
      end
      it "should accept 45 as 45 minutes" do
        @p_log.practice_duration = "45"
        @p_log.duration.should == 45
      end
    end
    context "Jerk move" do
      before(:each) { @p_log.duration = 75}
      it "should do bad things with bad input" do
        lambda { @p_log.practice_duration = "a"}.should raise_error
      end
      it "should error when no duration is specified" do
        @p_log.duration = 0
        @p_log.practice_duration = ""
        lambda { 
          @p_log.save!
        }.should raise_error
        
      end
    end
  end
  it 'has event calendar' do
    # PracticeLog needs to do has_event_calendar. To ensure it's (mostly) working
    # right, we'll just call the model method that event_calendar needs.
    PracticeLog.event_strips_for_month(Date.today).should_not be_nil
  end
end
