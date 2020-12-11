class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_sea, only: [:show, :edit, :update, :destroy]
  def index
    @seas = Sea.all
  end

  def show
  end

  def destroy
    @sea.destroy if user_signed_in? && current_user.id == @sea.user_id
    redirect_to root_path
  end

  def edit
      unless @sea.user_id == current_user.id
      redirect_to action: :index 
      end
  end

  def update
    if @sea.update(sea_params)
      redirect_to homes_path
    else
      render :edit
    end
  end



  private

  def sea_params
      params.require(:sea).permit(:seaname, :address, :explanation, :car_id, :shower_id, :area_id, :image).merge(user_id: current_user.id)
  end

  def set_sea
    @sea = Sea.find(params[:id])
  end

end
