class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
    @employees = @company.employees
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.all
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end