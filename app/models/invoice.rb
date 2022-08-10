class Invoice < ApplicationRecord
  enum status: { cancelled: 0, in_progress: 1, completed: 2 }

  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items
  has_many :bulk_discounts, through: :merchants
  belongs_to :customer

  def formatted_date
    created_at.strftime('%A, %B %d, %Y')
  end

  def customer_name
    "#{customer.first_name} #{customer.last_name}"
  end

  # invoice status 1 or 2, invoice_item status 0 or 1
  def self.invoices_with_items_not_shipped
    temp = self.where.not(status: 0)
    valid_invoices =  temp.distinct.joins(:invoice_items)
                          .where.not("invoice_items.status = 2")
                          .order(created_at: :desc)
  end

  def total_revenue
    invoice_items.sum('quantity * unit_price')
  end

  def discount_amount # discount value
    invoice_items.joins(:bulk_discounts)
    .select("invoice_items.id, max(invoice_items.unit_price * invoice_items.quantity * (bulk_discounts.discount / 100.00)) as discount") # get the highest discount
    .where("invoice_items.quantity >= bulk_discounts.threshold_amount") #invoice item quantity needs to exceed the discounts threshold quantity
    .group(:id) #consolidates queries by id
    .sum(&:discount).to_i #sums all the discounts found
  end

  def total_discount_revenue #revenue after the discount was applied
    total_revenue - discount_amount
  end
end

