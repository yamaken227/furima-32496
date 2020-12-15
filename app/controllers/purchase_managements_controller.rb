class PurchaseManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @form_purchase_management = FormPurchaseManagement.new
  end

  def create
    @form_purchase_management = FormPurchaseManagement.new(form_purchase_management_params)
    if @form_purchase_management.valid?
      pay_item
      @form_purchase_management.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def form_purchase_management_params
    params.require(:form_purchase_management).permit(:postal_code, :prefecture_id, :municipality,
      :address, :building_name, :phone_num, :price).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: form_purchase_management_params[:token],
      currency: 'jpy'
    )
  end
end
