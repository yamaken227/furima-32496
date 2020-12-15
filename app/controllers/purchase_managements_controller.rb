class PurchaseManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @form_purchase_management = FormPurchaseManagement.new
  end

  def create
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase_management
    @form_purchase_management = FormPurchaseManagement.new(form_purchase_management_params)
    if @form_purchase_management.valid?
      pay_item
      @form_purchase_management.save
      redirect_to root_path
    else
      @form_purchase_management.postal_code = nil
      @form_purchase_management.prefecture_id = nil
      @form_purchase_management.municipality = nil
      @form_purchase_management.address = nil
      @form_purchase_management.building_name = nil
      @form_purchase_management.phone_num = nil
      @form_purchase_management.token = nil
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def form_purchase_management_params
    params.require(:form_purchase_management).permit(:postal_code, :prefecture_id, :municipality, :address,
                                                     :building_name, :phone_num, :price).merge(item_id: params[:item_id],
                                                                                               user_id: current_user.id,
                                                                                               token: params[:token])
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
