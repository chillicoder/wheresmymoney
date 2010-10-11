class ChangeAuthorizations < ActiveRecord::Migration
  def self.up
    change_table :authorizations do |t|
      t.remove :user_id
      t.integer :account_id
    end
  end

  def self.down
    change_table :authorizations do |t|
      t.remove :account_id
      t.string :user_id
    end
  end
end
