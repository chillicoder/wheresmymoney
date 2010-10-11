require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Authorization Model" do
  let(:account) { Account.create(:name => "John", :surname => "Doe", 
                           :email => "john@doe.com", :password => "john",
                           :password_confirmation => "john", :role => "member") }
  let(:authorization) { Authorization.new(:provider => "facebook", :uid => "uid",
                                          :account_id => account.id) }

  it 'can be created' do
    authorization.should_not be_nil
  end

  it 'should be valid' do
    authorization.should be_valid
  end
end
