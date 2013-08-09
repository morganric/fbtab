class HomeController < ApplicationController
  def index
    @users = User.all

    @rg = RestGraph.new(:access_token => '')

  end
end
