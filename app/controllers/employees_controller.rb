class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def show
    @employee = Employee.find(params[:id])
    @employee_assets = @employee.business_assets
    @other_assets = BusinessAsset.all - @employee_assets
  end

  def index
    @employees = Employee.all
  end

  def destroy
    @employee = Employee.find(params[:id])
    company = @employee.company
    @employee.accesses.destroy_all
    if @employee.destroy
      redirect_to company_path(company)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :surname, :email, :phone_number, :company_id)
  end
end