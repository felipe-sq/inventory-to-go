class ItemsController < ApplicationController

  def index
    @department = Department.find(params[:department_id])
    @items = @department.items
    render json: @items.to_json, status: 200
  end

  def create
    @department = Department.find(params[:department_id])
    @item = @department.items.build(item_params)

    if @item.save
      render json: @item.to_json, status: 201
    else
      render json: { error: 'Item is invalid. Please try again.' }, status: 400
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)

    if @item.save
      render json: @item.to_json, status: 200
    else
      render json: { error: "Item update failed. Please try again." }, status: 400
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.delete
      render json: @item.to_json, status: 201
    else
      render json: { error: "Item could not be deleted. Please try again." }, status: 400
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :amount, :reviewed)
  end
end
