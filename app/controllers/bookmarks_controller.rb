class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new]
  def new
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list_id), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
