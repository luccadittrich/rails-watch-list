class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new

    @list = List.find(params[:list_id])

    @cards = Card.all
  end

  def create
    @cards = Card.all
    @favorite = Favorite.new(favorite_params)
    @list = List.find(params[:list_id])
    @favorite.list = @list

    if @favorite.save
      redirect_to list_path(@list)
    else
      render :new, notice: "não foi criado"
    end
  end

  def show
    @list = List.find(params[:id])
    @favorites = Favorite.where(list_id: @list)
  end

  def destroy
    #@list = List.find(params[:id])
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to list_path(@favorite.list)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:name, :image_url, :card_id, :list_id)
  end
end
