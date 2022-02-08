class HomeController < ApplicationController
  def home
    @host_types = HostType.all
    @info_types = InfoType.all
    @priorities = Priority.all
  end
end