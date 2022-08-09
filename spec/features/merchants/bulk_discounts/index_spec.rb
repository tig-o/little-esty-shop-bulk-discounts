require 'rails_helper'

RSpec.describe 'bulk discounts index' do
    it 'displays a merchants bulk discounts and their attributes' do
        pokemart = Merchant.create!(name: "PokeMart")
        pokegarden = Merchant.create!(name: "PokeGarden")

        pokemart_sale1 = BulkDiscount.create!(discount: 5, threshold_amount: 10, merchant: pokemart)
        pokemart_sale2 = BulkDiscount.create!(discount: 10, threshold_amount: 15, merchant: pokemart)
        pokemart_sale3 = BulkDiscount.create!(discount: 15, threshold_amount: 20, merchant: pokemart)
        pokegarden_sale1 = BulkDiscount.create!(discount: 15, threshold_amount: 10, merchant: pokegarden)
        pokegarden_sale2 = BulkDiscount.create!(discount: 25, threshold_amount: 20, merchant: pokegarden)
        pokegarden_sale3 = BulkDiscount.create!(discount: 30, threshold_amount: 25, merchant: pokegarden)

        visit merchant_bulk_discounts_path(pokemart.id)

        within "#bulk-discount#{pokemart_sale1.id}" do
            expect(page).to have_content("5% off at 10 items!")
            expect(page).to_not have_content("15")
        end

        within "#bulk-discount#{pokemart_sale2.id}" do
            expect(page).to have_content("10% off at 15 items!")
            expect(page).to_not have_content("25")
        end

        within "#bulk-discount#{pokemart_sale3.id}" do
            expect(page).to have_content("15% off at 20 items!")
            expect(page).to_not have_content("30")
        end
    end
end