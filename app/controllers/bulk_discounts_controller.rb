class BulkDiscountsController < ApplicationController
    def index
        @merchant = Merchant.find(params[:merchant_id])
        @bulk_discounts = @merchant.bulk_discounts
    end

    def show
        @bulk_discount = BulkDiscount.find(params[:id])
    end

    def new
        @merchant = Merchant.find(params[:merchant_id])
    end

    def create
        BulkDiscount.create!(merchant_id: params[:merchant_id], discount: params[:discount], threshold_amount: params[:threshold_amount])
        redirect_to merchant_bulk_discounts_path(params[:merchant_id])
    end

    def destroy
        BulkDiscount.find(params[:id]).destroy
        redirect_to merchant_bulk_discounts_path(params[:merchant_id])
    end

end