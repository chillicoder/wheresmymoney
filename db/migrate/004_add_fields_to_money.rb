class AddFieldsToMoney < ActiveRecord::Migration
  def self.up
    change_table :money do |t|
      t.belongs_to :account
    end
  end

  def self.down
    change_table :money do |t|
      t.remove :account
    end
  end
end
