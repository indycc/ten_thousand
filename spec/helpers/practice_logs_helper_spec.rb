require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PracticeLogsHelper. For example:
#
 describe PracticeLogsHelper do
   describe "Duration is formatted time string" do
     it "shows under one hour as a number" do
       helper.format_time(45).should == "45 minutes"
     end
     it "shows 60 minutes as '1 hour'" do
       helper.format_time(60).should == "1 hour"
     end
     it "shows 75 minutes as '1 hour 15 minutes'" do
       helper.format_time(75).should == "1 hour 15 minutes"
     end
     it "shows 135 minutes as '2 hours 15 minutes'" do
       helper.format_time(135).should == "2 hours 15 minutes"
     end
     it "shows 61 minutes as '1 hour 1 minute'" do
       helper.format_time(61).should == "1 hour 1 minute"
     end
   end
 end
