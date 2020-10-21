class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checkout, only: [:show, :edit, :update, :destroy]

  
  def new
    @checkout = Checkout.new
  end

  def create 

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout
      @checkout = Checkout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkout_params
      params.require(:checkout).permit(:coupon_code, :user_id)
    end
end