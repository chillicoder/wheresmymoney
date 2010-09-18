require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Account Model" do
  before do  
    @account = Account.new(:name => "John", :surname => "Doe", 
                           :email => "john@doe.com", :password => "john",
                           :password_confirmation => "john", :role => "admin")
  end

  it 'can be created' do
    @account.should_not be_nil
  end

  it 'should be valid' do
    @account.should be_valid
  end

  it 'should have an unique e-mail' do
    @invalid_account = Account.new({:email => "dario@q-innova.com.ar"})
    @invalid_account.should_not be_valid
  end
end
