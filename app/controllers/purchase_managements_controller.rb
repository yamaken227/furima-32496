class PurchaseManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @form_purchase_management = FormPurchaseManagement.new
  end

  def create
    @form_purchase_management = FormPurchaseManagement.new(form_purchase_management_params)
    if @form_purchase_management.save
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
      :address, :building_name, :phone_num).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
