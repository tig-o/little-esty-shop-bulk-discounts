class InvoiceItem < ApplicationRecord
  enum status: {packaged: 0, pending: 1, shipped: 2}

  belongs_to :invoice
  belongs_to :item
  has_one :merchant, through: :item
  has_many :bulk_discounts, through: :merchant

  def total_revenue
    quantity * unit_price
  end

  
end