class ItemsController < ApplicationController
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :cotegory_id, :condition_id, :delivery_charge_id, :prefecture_id, :transit_day_id, :price).merge(user_id: current_user.id)
  end

end
