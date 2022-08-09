require 'rails_helper'

RSpec.describe 'bulk discounts new' do
    it 'displays a form to create a new discount' do
        pokemart = Merchant.create!(name: "PokeMart")
        pokegarden = Merchant.create!(name: "PokeGarden")

        pokemart_sale1 = BulkDiscount.create!(discount: 5, threshold_amount: 10, merchant: pokemart)
        pokemart_sale2 = BulkDiscount.create!(discount: 10, threshold_amount: 15, merchant: pokemart)
        pokemart_sale3 = BulkDiscount.create!(discount: 15, threshold_amount: 20, merchant: pokemart)
        pokegarden_sale1 = BulkDiscount.create!(discount: 15, threshold_amount: 10, merchant: pokegarden)
        pokegarden_sale2 = BulkDiscount.create!(discount: 25, threshold_amount: 20, merchant: pokegarden)
        pokegarden_sale3 = BulkDiscount.create!(discount: 30, threshold_amount: 25, merchant: pokegarden)

        visit new_merchant_bulk_discount_path(pokemart)
        
        within "#create-form" do
            fill_in :discount, with: 25
            fill_in :threshold_amount, with: 30
            click_on "Submit"
        end
        
        expect(current_path).to eq(merchant_bulk_discounts_path(pokemart))
        expect(page).to have_content('Discount Deal: 25% off at 30 items!')
    end
end

