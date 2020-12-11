class SeasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @seas = Sea.all
  end

  def new
    @sea = Sea.new
  end

  def create
    @sea = Sea.new(sea_params)
    if @sea.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def sea_params
    params.require(:sea).permit(:seaname, :address, :explanation, :car_id, :shower_id, :area_id, :image).merge(user_id: current_user.id)
  end

end
