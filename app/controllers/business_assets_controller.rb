class BusinessAssetsController < ApplicationController

  def new
    @business_asset = BusinessAsset.new
  end

  def show
    @business_asset = BusinessAsset.find(params[:id])
    @asset_employees = @business_asset.employees
    @other_employees = Employee.all - @asset_employees
  end

  def edit
    @business_asset = BusinessAsset.find(params[:id])
  end

  def update
    @business_asset = BusinessAsset.find(params[:id])
    if @business_asset.update(business_asset_params)
      redirect_to :root
    else
      render 'edit'
    end
  end

  def create
    @business_asset = BusinessAsset.new(business_asset_params)
    if @business_asset.save
      redirect_to :root
    else
      render 'new'
    end
  end

  def index
    @business_assets = BusinessAsset.all
  end

  private

  def business_asset_params
    params.require(:business_asset).permit(:business_asset_code, :cost, :cost_type, :name, :admin_id, :host_type_id, :info_type_id, :priority_id)
  end
end