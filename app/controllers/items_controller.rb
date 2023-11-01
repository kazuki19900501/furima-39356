class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  def index
    @items = Item.order(created_at: :desc)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :cotegory_id, :condition_id, :delivery_charge_id, :prefecture_id, :transit_day_id, :price).merge(user_id: current_user.id)
  end

end
