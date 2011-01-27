require 'spec_helper'

describe Expertise do
  before { subject.color = 'color' }
  describe 'default values' do
    its(:seconds_required) { should == 10000.hours }
    its(:seconds_remaining) { should == 10000.hours }
    its(:hours_remaining) { should == 10000 }
  end
  describe 'after some practice' do
    before do
      subject.user = User.create!
      subject.save!
      subject.practice_logs.create! :duration => 100.minutes
      subject.practice_logs.create! :duration => 10.minutes
    end
    its(:seconds_required) { should == 10000.hours }
    its(:seconds_remaining) { should == (10000.hours - 110.minutes) }
    its(:hours_remaining) { should == 9998 }
  end
  it "disallows XSS on color" do
    subject.color = %("><script>alert('hi')</script>)
    subject.should have(1).errors_on(:color)
  end
  it "disallows nil color" do
    subject.color = nil
    subject.should have(1).errors_on(:color)
  end
  it "allows RGB colors" do
    subject.color = '#f80'
    subject.should have(:no).errors_on(:color)
  end
  it "allows RRGGBB colors" do
    subject.color = '#fe8710'
    subject.should have(:no).errors_on(:color)
  end
  it "allows named colors" do
    subject.color = 'fuscia'
    subject.should have(:no).errors_on(:color)
  end
end
