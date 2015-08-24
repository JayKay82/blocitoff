class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to :back
    else
      redirect_to :back, error: 'Unable to create new mission. Please try again.'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
