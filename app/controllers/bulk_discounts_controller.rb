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

    def edit
        @bulk_discount = BulkDiscount.find(params[:id])
    end

    def update
        @bulk_discount = BulkDiscount.find(params[:id])
        @bulk_discount.update(discount: bulk_discount_params[:discount], threshold_amount: bulk_discount_params[:threshold_amount])
        redirect_to merchant_bulk_discount_path(@bulk_discount.merchant,@bulk_discount)
    end

    def destroy
        BulkDiscount.find(params[:id]).destroy
        redirect_to merchant_bulk_discounts_path(params[:merchant_id])
    end

    private
    
    def bulk_discount_params
        params.permit(:merchant_id, :discount, :threshold_amount)
    end
end