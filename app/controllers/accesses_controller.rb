class AccessesController < ApplicationController

  def create
    @access = Access.new(access_params)
    if @access.save && params.dig(:access, :page) == 'Asset'
      redirect_to business_asset_path(@access.business_asset)
    elsif @access.save && params.dig(:access, :page) == 'User'
      redirect_to employee_path(@access.employee)
    else
      redirect_back(fallback_location: root_path) and return
    end
  end

  def destroy
    @access = Access.find(params[:id])
    @access.destroy
    redirect_back(fallback_location: root_path) and return
  end

  private

  def access_params
    params.require(:access).permit(:business_asset_id, :employee_id)
  end
end