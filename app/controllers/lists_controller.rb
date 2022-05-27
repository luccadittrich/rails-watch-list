class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
