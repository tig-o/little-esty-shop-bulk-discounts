require 'rails_helper'

RSpec.describe 'bulk discounts show' do
    it 'displays discount percent and threshold amount' do
        pokemart = Merchant.create!(name: "PokeMart")
        pokegarden = Merchant.create!(name: "PokeGarden")

        pokemart_sale1 = BulkDiscount.create!(discount: 5, threshold_amount: 10, merchant: pokemart)
        pokemart_sale2 = BulkDiscount.create!(discount: 10, threshold_amount: 15, merchant: pokemart)
        pokemart_sale3 = BulkDiscount.create!(discount: 15, threshold_amount: 20, merchant: pokemart)
        pokegarden_sale1 = BulkDiscount.create!(discount: 15, threshold_amount: 10, merchant: pokegarden)
        pokegarden_sale2 = BulkDiscount.create!(discount: 25, threshold_amount: 20, merchant: pokegarden)
        pokegarden_sale3 = BulkDiscount.create!(discount: 30, threshold_amount: 25, merchant: pokegarden)

        visit "/merchants/#{pokemart.id}/bulk_discounts/#{pokemart_sale1.id}"
        
        within "#discount-details" do
            expect(page).to have_content('Discount Percent: 5%')
            expect(page).to have_content('Item Amount Required: 10 items')
            expect(page).to_not have_content('Discount Percent: 10%')
            expect(page).to_not have_content('Item Amount Required: 15 items')
        end
    end

    it 'displays link to edit the discount' do
        pokemart = Merchant.create!(name: "PokeMart")
        pokegarden = Merchant.create!(name: "PokeGarden")

        pokemart_sale1 = BulkDiscount.create!(discount: 5, threshold_amount: 10, merchant: pokemart)
        pokemart_sale2 = BulkDiscount.create!(discount: 10, threshold_amount: 15, merchant: pokemart)
        pokemart_sale3 = BulkDiscount.create!(discount: 15, threshold_amount: 20, merchant: pokemart)
        pokegarden_sale1 = BulkDiscount.create!(discount: 15, threshold_amount: 10, merchant: pokegarden)
        pokegarden_sale2 = BulkDiscount.create!(discount: 25, threshold_amount: 20, merchant: pokegarden)
        pokegarden_sale3 = BulkDiscount.create!(discount: 30, threshold_amount: 25, merchant: pokegarden)

        visit "/merchants/#{pokemart.id}/bulk_discounts/#{pokemart_sale1.id}"
        
        within "#discount-details" do
            expect(page).to have_content('Discount Percent: 5%')
            expect(page).to have_content('Item Amount Required: 10 items')

            click_link "Edit Discount"
        end

        expect(current_path).to eq(edit_merchant_bulk_discount_path(pokemart_sale1.merchant,pokemart_sale1))
    end
end