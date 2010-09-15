class CreateMoney < ActiveRecord::Migration
  def self.up
    create_table :money do |t|
      t.decimal :amount
      t.string :currency
      t.datetime :datetime
      t.string :concepts
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :money
  end
end
