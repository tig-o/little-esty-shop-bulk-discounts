require 'rails_helper'

RSpec.describe 'bulk discounts edit' do
    it 'displays form to edit the discount' do

        pokemart = Merchant.create!(name: "PokeMart")
        pokegarden = Merchant.create!(name: "PokeGarden")

        pokemart_sale1 = BulkDiscount.create!(discount: 5, threshold_amount: 10, merchant: pokemart)
        pokemart_sale2 = BulkDiscount.create!(discount: 10, threshold_amount: 15, merchant: pokemart)
        pokemart_sale3 = BulkDiscount.create!(discount: 15, threshold_amount: 20, merchant: pokemart)
        pokegarden_sale1 = BulkDiscount.create!(discount: 15, threshold_amount: 10, merchant: pokegarden)
        pokegarden_sale2 = BulkDiscount.create!(discount: 25, threshold_amount: 20, merchant: pokegarden)
        pokegarden_sale3 = BulkDiscount.create!(discount: 30, threshold_amount: 25, merchant: pokegarden)

        visit edit_merchant_bulk_discount_path(pokemart_sale1.merchant,pokemart_sale1)
        
        within "#discount-edit-form" do
            expect(page).to have_field("Discount Percent", with: 5)
            expect(page).to have_field("Item Amount Required", with: 10)
            
            fill_in "Discount Percent", with: 4
            fill_in "Item Amount Required", with: 11
            
            click_on "Submit"
        end
        
        expect(current_path).to eq("/merchants/#{pokemart.id}/bulk_discounts/#{pokemart_sale1.id}")
        expect(page).to have_content('Discount Percent: 4%')
        expect(page).to have_content('Item Amount Required: 11 items')
    end
end