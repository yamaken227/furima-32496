class ItemsController < ApplicationController
  def index
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :categoly_id, :status_id, :fee_burden_id, :prefecture_id, :days_to_ship_id, :price ,:image).merge(user_id: current_user.id)
  end
end
