class PrioritiesController < ApplicationController

  def new
    @priority = Priority.new
  end

  def create
    @priority = Priority.new(priority_params)
    if @priority.save
      redirect_to priorities_path
    else
      render 'new'
    end
  end

  def index
    @priorities = Priority.all
  end

  def destroy
    @priority = Priority.find(params[:id])
    if !@priority.business_assets.any?
      @priority.destroy
      redirect_back(fallback_location: root_path) and return
    else
      redirect_back(fallback_location: root_path, notice: "error: record has children") and return
    end
  end

  private

  def priority_params
    params.require(:priority).permit(:description)
  end
end