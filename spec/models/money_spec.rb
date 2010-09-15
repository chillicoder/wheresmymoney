require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Money Model" do
  it 'can be created' do
    @money = Money.new
    @money.should_not be_nil
  end
end
