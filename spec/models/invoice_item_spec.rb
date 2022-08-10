require 'rails_helper'

RSpec.describe InvoiceItem do
  describe 'relationships' do
    it { should belong_to :invoice }
    it { should belong_to :item }
    it { should have_one(:merchant).through(:item) }
    it { should have_many(:bulk_discounts).through(:merchant) }
  end

  describe 'instance methods' do
    it 'returns total_revenue' do
      merchant1 = Merchant.create!(name: "Snake Shop")
      customer = Customer.create!(first_name: "Alep", last_name: "Bloyd")
      item1_merchant1 = Item.create!(name: "Snake Pants", description: "It is just a sock.", unit_price: 400, merchant_id: merchant1.id)
      invoice1 = Invoice.create!(customer_id: customer.id, status: 2)
      invoiceitem1_item1_invoice1 = InvoiceItem.create!(item_id: item1_merchant1.id, invoice_id: invoice1.id, quantity: 70, unit_price: 50, status: 0)

      expect(invoiceitem1_item1_invoice1.total_revenue).to eq(3500)
    end

    it 'it #check_discounts for each item' do
      pokemart = Merchant.create!(name: "PokeMart")

      red = Customer.create!(first_name: 'Red', last_name: 'Trainer')
      item1 = pokemart.items.create!(name: 'Phoenix Feather Wand', description: 'Ergonomic grip', unit_price: 30)
      item2 = pokemart.items.create!(name: 'Harmonica', description: 'Makes pretty noise', unit_price: 20)
      item3 = pokemart.items.create!(name: 'Bag of Holding', description: 'This bag has an interior space considerably larger than its outside dimensions, roughly 2 feet in diameter at the mouth and 4 feet deep.', unit_price: 10)

      invoice1 = red.invoices.create!(status: 1)

      invoice_item1 = InvoiceItem.create!(invoice: invoice1, item: item1, quantity: 10, unit_price: 30, status: 1)
      invoice_item2 = InvoiceItem.create!(invoice: invoice1, item: item2, quantity: 21, unit_price: 20, status: 1)
      invoice_item3 = InvoiceItem.create!(invoice: invoice1, item: item3, quantity: 5, unit_price: 10, status: 1)

      pokemart_sale1 = BulkDiscount.create!(discount: 10, threshold_amount: 10, merchant: pokemart)
      pokemart_sale2 = BulkDiscount.create!(discount: 15, threshold_amount: 20, merchant: pokemart)
      pokemart_sale3 = BulkDiscount.create!(discount: 25, threshold_amount: 30, merchant: pokemart)

      expect(invoice_item1.check_discount).to eq(pokemart_sale1)
      expect(invoice_item2.check_discount).to eq(pokemart_sale2)
      expect(invoice_item3.check_discount).to eq(nil)
    end
  end
end