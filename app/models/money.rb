class Money < ActiveRecord::Base
  # Relations
  belongs_to :account

  # Validations
  validates_presence_of :amount, :currency, :datetime, :account
  validates_numericality_of :amount
  validates_length_of :currency, :is => 3
  validates_associated :account
end
