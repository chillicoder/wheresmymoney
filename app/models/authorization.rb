class Authorization < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :account_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, account = nil)
    account ||= Account.create_from_hash!(hash)
    puts account.inspect
    create(:account_id => account.id, :uid => hash['uid'], :provider => hash['provider'])
  end
end
