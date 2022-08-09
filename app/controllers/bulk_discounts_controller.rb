class BulkDiscountsController < ApplicationController
    def index
        @merchant = Merchant.find(params[:merchant_id])
        @bulk_discounts = @merchant.bulk_discounts
    end

    def show

    end

    def new
        @merchant = Merchant.find(params[:merchant_id])
    end

    def create
        BulkDiscount.create!(merchant_id: params[:merchant_id], discount: params[:discount], threshold_amount: params[:threshold_amount])
        redirect_to merchant_bulk_discounts_path(params[:merchant_id])
    end


end