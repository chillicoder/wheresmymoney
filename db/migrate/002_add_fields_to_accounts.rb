class AddFieldsToAccounts < ActiveRecord::Migration
  def self.up
    change_table :accounts do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
    Account.update_all ["created_at = ?, updated_at = ?", Time.now, Time.now]
  end

  def self.down
    change_table :accounts do |t|
      t.remove :created_at
      t.remove :updated_at
    end
  end
end
