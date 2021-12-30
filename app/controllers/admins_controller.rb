class AdminsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admins_path
    else
      render 'new'
    end
  end

  def index
    @admins = Admin.all
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email)
  end
end