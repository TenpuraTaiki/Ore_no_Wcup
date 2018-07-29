class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
    @participations = Participation.where(wcup_id: params[:wcup_id])
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to root_path
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(favorite_params)
    redirect_to root_path
  end

  def destroy
  end

  private
    def favorite_params

      params.require(:favorite).permit(:wcup_id,:user_id,:comment)

    end
end
