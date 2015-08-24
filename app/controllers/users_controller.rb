class UsersController < ApplicationController

  def show
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to edit_user_registration_path, notice: 'Information successfully updated.'
    else
      redirect_to edit_user_registration_path, error: 'Unable to update information. Please try again.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end

  def item
    @item ||= Item.new
  end

  def items
    @items ||= current_user.items.all
  end

  helper_method :item, :items

end
