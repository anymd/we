class ItemsController < ApplicationController

  before_filter :find_item, only: [:show]

  def show
  end

  private

  def find_item
    @item = Item.find_by_slug(params[:id])
  end

end
