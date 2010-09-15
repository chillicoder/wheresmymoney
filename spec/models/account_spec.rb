require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Account Model" do
  it 'can be created' do
    @account = Account.new
    @account.should_not be_nil
  end

  it 'should have an unique e-mail' do
    @account = Account.new({:email => "dario@q-innova.com.ar"})
    @invalid_account = Account.new({:email => "dario@q-innova.com.ar"})
    @invalid_account.should_not be_valid
  end
end
