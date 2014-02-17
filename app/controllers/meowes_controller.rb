class MeowesController < ApplicationController

  def index
    @meowes = Meowe.all
    @meow = Meowe.new
  end

  def create
     meowe = Meowe.new(params[:meowe])
    meowe.user_id = current_user.id



      flash[:error] = "Your Meow was over 140 characters"  unless meowe.save
    redirect_to root_url
    end
  end

