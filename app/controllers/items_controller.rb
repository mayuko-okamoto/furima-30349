class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def item_params
    params.require(:item).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
