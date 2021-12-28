class AssetController < ApplicationController
  def index
    @assets = Asset.all
  end

  private

  def asset_params
    params.require(:asset).permit(:asset_code, :cost, :cost_type, :name)
  end
end