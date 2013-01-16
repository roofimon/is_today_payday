require "rspec"
require "payday"
require 'date'

describe PayMaster do
  let(:pay_master){ PayMaster.new }
  let(:current_date){ Date.today }
  describe "ask for payday" do
    context "when payday is weekday" do
      it "should tell me that my payday is 'Tuesday, 26-02-2013" do
        Date.stub!(:today).and_return(Date.rfc2822('Tue, 26 Feb 2013 00:00:00 +0000'))
        pay_master.when_is_my_payday.should eq("Tuesday, 26-02-2013")
      end
    end
    context "when payday is weekend" do
      it "should tell me that
        'An actual payday is weekend so your Pay Master will pay you sooner and your payday is 'Friday, that_date-current_month-current_year'" do
          Date.stub!(:today).and_return(Date.rfc2822('Sun, 26 May 2013 00:00:00 +0000'))
          pay_master.when_is_my_payday.should eq("An actual payday is weekend so your Pay Master will pay you sooner and your payday is Friday, 24-05-2013")
      end
      it "should tell me that
        'An actual payday is weekend so your Pay Master will pay you sooner and your payday is 'Friday, that_date-current_month-current_year'" do
        Date.stub!(:today).and_return(Date.rfc2822('Sat, 26 Oct 2013 00:00:00 +0000'))
        pay_master.when_is_my_payday.should eq("An actual payday is weekend so your Pay Master will pay you sooner and your payday is Friday, 25-10-2013")
      end
    end
  end


  describe "today is payday" do
    it "should tell me that 'Today is payday dude, you gonna be rich :)'" do
      pay_master.today_is_payday(Date.today).should eq("Today is payday dude, you gonna be rich")
    end
  end

  describe "today is weekend" do
    context "saturday" do
      it "should tell me that 'Stupid dude, who's gonna pay you on weekend'" do
        pay_master.today_is_payday(Date.rfc2822('Sat, 12 Jan 2013 00:00:00 +0000')).should eq("Stupid dude, who's gonna pay you on weekend")
      end
    end
    context "sunday" do
      it "should tell me that 'Stupid dude, who's gonna pay you on weekend'" do
        pay_master.today_is_payday(Date.rfc2822('Sun, 13 Jan 2013 00:00:00 +0000')).should eq("Stupid dude, who's gonna pay you on weekend")
      end
    end
  end

end