class HostTypesController < ApplicationController

  def new
    @host_type = HostType.new
  end

  def create
    @host_type = HostType.new(host_type_params)
    if @host_type.save
      redirect_to host_types_path
    else
      render 'new'
    end
  end

  def index
    @host_types = HostType.all
  end

  def destroy
    @host_type = HostType.find(params[:id])
    if !@host_type.business_assets.any?
      @host_type.destroy
      redirect_back(fallback_location: root_path) and return
    else
      redirect_back(fallback_location: root_path, notice: "error: record has children") and return
    end
  end

  private

  def host_type_params
    params.require(:host_type).permit(:description)
  end
end