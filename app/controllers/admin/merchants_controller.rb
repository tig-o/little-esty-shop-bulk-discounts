class Admin::MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])

    if params[:commit] == "Disable"
      @merchant.update(status: params[:status])
      redirect_to admin_merchants_path
    elsif params[:commit] == "Enable"
      @merchant.update(status: params[:status])
      redirect_to admin_merchants_path
    else
      redirect_to admin_merchants_path, notice: "ERROR PROCESSING REQUEST!"
    end
  end
private
  def merchant__params
    params.permit(:status)
  end
end