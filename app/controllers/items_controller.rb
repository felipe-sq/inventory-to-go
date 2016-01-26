class ItemsController < ApplicationController

  def index
    @department = Department.find_by(params[:id])
    @items = @department.items
    render json: @items.to_json, status: 200
  end

  def create
  end

  def update
  end

  def destroy
  end
end
