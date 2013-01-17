require "rspec"
require "payday"
require 'date'

describe PayMaster do
  let(:pay_master){ PayMaster.new }
  let(:current_date){ Date.today }
  let(:early_payment_message) {"An actual payday is weekend so your Pay Master will pay you sooner and your payday is"}
  let(:weekend_payment_warning) {"Stupid dude, who's gonna pay you on weekend"}

  describe "ask for payday" do
    context "when payday is weekday" do
      it "should tell me that my payday is 'Tuesday, 26-02-2013" do
        Date.stub!(:today).and_return(Date.rfc2822('Tue, 26 Feb 2013 00:00:00 +0000'))
        pay_master.when_is_my_payday.should eq("Tuesday, 26-02-2013")
      end
    end
    context "when payday is weekend" do
      it "should tell me an early_payment_message with 'Friday, that_date-current_month-current_year'" do
          Date.stub!(:today).and_return(Date.rfc2822('Sun, 26 May 2013 00:00:00 +0000'))
          pay_master.when_is_my_payday.should eq( "#{early_payment_message} Friday, 24-05-2013")
      end
      it "should tell me an early_payment_message with 'Friday, that_date-current_month-current_year'" do
        Date.stub!(:today).and_return(Date.rfc2822('Sat, 26 Oct 2013 00:00:00 +0000'))
        pay_master.when_is_my_payday.should eq("#{early_payment_message} Friday, 25-10-2013")
      end
    end
  end


  describe "today is payday" do
    it "should tell me that 'Today is payday dude, you gonna be rich :)'" do
      Date.stub!(:today).and_return(Date.rfc2822('Tue, 26 Feb 2013 00:00:00 +0000'))
      pay_master.is_payday().should eq("Today is payday dude, you gonna be rich")
    end
  end

  describe "today is weekend" do
    context "saturday" do
      it "should tell me that 'Stupid dude, who's gonna pay you on weekend'" do
        Date.stub!(:today).and_return(Date.rfc2822('Sat, 26 Oct 2013 00:00:00 +0000'))
        pay_master.is_payday().should eq(weekend_payment_warning)
      end
    end
    context "sunday" do
      it "should tell me that 'Stupid dude, who's gonna pay you on weekend'" do
        Date.stub!(:today).and_return(Date.rfc2822('Sun, 26 May 2013 00:00:00 +0000'))
        pay_master.is_payday().should eq(weekend_payment_warning)
      end
    end
  end

  describe "today is not payday" do
    it "should tell me that 'Sorry dude you have to wait for x days'" do
      Date.stub!(:today).and_return(Date.rfc2822('Thu, 14 Feb 2013 00:00:00 +0000'))
      pay_master.is_payday().should eq("Sorry dude you have to wait for 12 days")
    end
  end

end