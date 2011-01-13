require 'spec_helper'

describe Expertise do
  describe 'default values' do
    its(:seconds_required) { should == 10000.hours }
    its(:seconds_remaining) { should == 10000.hours }
    its(:hours_remaining) { should == 10000 }
  end
  describe 'after some practice' do
    before do
      subject.save!
      subject.practice_logs.create! :duration => 100.minutes
      subject.practice_logs.create! :duration => 10.minutes
    end
    its(:seconds_required) { should == 10000.hours }
    its(:seconds_remaining) { should == (10000.hours - 110.minutes) }
    its(:hours_remaining) { should == 9998 }
  end
end
