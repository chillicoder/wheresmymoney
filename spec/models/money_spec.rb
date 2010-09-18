require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Money Model" do
  before do
    @account = Account.new(:name => "John", :surname => "Doe", 
                           :email => "john@doe.com", :password => "john",
                           :password_confirmation => "john", :role => "admin")
    @money = Money.new(:amount => 0, :currency => "EUR", 
                       :datetime => Date.today, :concepts => "something", 
                       :account => @account)
  end

  it 'can be created' do
    @money.should_not be_nil
  end

  it 'should have a numeric amount' do
    @money.amount = "number"
    @money.should_not be_valid

    @money.amount = 2
    @money.should be_valid
  end

  it 'should have a currency of 3 characters long' do
    @money.currency = "EURO"
    @money.should_not be_valid

    @money.currency = "EUR"
    @money.should be_valid
  end

  it 'should have a valid account associated' do
    @invalid_account = Account.new
    @invalid_account.should_not be_valid
    @money.account = @invalid_account
    @money.should_not be_valid
  end
end
