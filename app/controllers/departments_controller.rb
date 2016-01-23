class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
    render json: @departments.to_json, status: 200
  end

  def create
    @department = Department.new(department_params)

    if @department.valid?
      @department.save!
      render json: @department.to_json, status: 201
    else
      render json: { error: "Department is invalid" }, status: 400
    end
  end

  def update
    @department = Department.find(params[:id])

    if @department.update_attributes(department_params)
      render json: @department.to_json, status: 200
    else
      render json: { error: "Department update failed" }, status: 400
    end
  end

  def destroy
    @department = Department.find(params[:id])

    if @department.delete
      render json: @department.to_json, status: 201
    else
      render json: { error: "Department could not be deleted. Please try again." }, status: 400
    end
    #render nothing: true, status: 204
  end

  def show
  end

  private

  def department_params
    params.require(:department).permit(:name, :description)
  end
end
