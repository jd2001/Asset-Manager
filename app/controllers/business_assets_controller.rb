class BusinessAssetsController < ApplicationController

  def new
    @business_asset = BusinessAsset.new
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