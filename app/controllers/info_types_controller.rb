class InfoTypesController < ApplicationController

  def new
    @info_type = InfoType.new
  end

  def create
    @info_type = InfoType.new(info_type_params)
    if @info_type.save
      redirect_to info_types_path
    else
      render 'new'
    end
  end

  def index
    @info_types = InfoType.all
  end

  private

  def info_type_params
    params.require(:info_type).permit(:name)
  end
end