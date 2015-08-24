class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @new_item = Item.new

    unless @item.save
      flash[:error] = 'Unable to create new mission. Please try again.'
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    unless item.destroy
      flash[:error] = 'Unable to destroy item. Please try again'
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def item
    @item ||= Item.find(params[:id])
  end

end
