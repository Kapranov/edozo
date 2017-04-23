class Good < ApplicationRecord
  validates :subtotal, :tax, :shipping, :total, presence: true
  enum status: [ :cancelled, :in_progress, :completed, :invoiced ]
end
