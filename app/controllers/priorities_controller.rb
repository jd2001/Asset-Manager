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

  private

  def priority_params
    params.require(:priority).permit(:description)
  end
end