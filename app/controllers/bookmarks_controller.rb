class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  # A user can add a new bookmark (movie/list pair) to an existing list
  # GET lists/42/bookmarks/new
  # POST lists/42/bookmarks

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # A user can delete a bookmark from a list
  # DELETE bookmarks/25

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
