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
      subject.name = "Test Expertise"
      subject.save!
      subject.practice_logs.create! :duration => 100.minutes, :occurred_on => Time.now
      subject.practice_logs.create! :duration => 10.minutes, :occurred_on => Time.now
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

  describe :time_spent do
    it 'should sum the practice logs from the last week' do
      user1 = User.create!
      user2 = User.create!
      subject.user = user1
      subject.name = "Test Expertise"
      subject.save!
      subject.practice_logs.create! :duration => 100.minutes, :occurred_on => Time.now
      subject.practice_logs.create! :duration => 10.minutes, :occurred_on => Time.now
      (other_expertise = Expertise.new do |e|
        e.color = 'gray'
        e.user = user2
        e.name = "Other"
      end).save!
      PracticeLog.create! :duration => 15.minutes, :occurred_on => Time.now, :expertise => other_expertise
      subject.time_spent.should == 110.minutes
    end

    it 'should not include older results' do
      subject.user = User.create!
      subject.name = "Test Expertise"
      subject.save!
      subject.practice_logs.create! :duration => 100.minutes, :occurred_on => Time.now - 8.days
      subject.time_spent.should == 0
    end
  end
end
