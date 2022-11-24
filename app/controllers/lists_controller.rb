class ListsController < ApplicationController
  # A user can see all the lists
  # GET "lists"
  def index
    @lists = List.all
  end

  # A user can see the details of a given list and its name
  # GET lists/42
  def show
    @list = List.find(params['id'])
  end

  # A user can create a new list
  # GET "lists/new"
  # POST "lists"
  def new
    @list = List.new(lists_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @list = List.new
  end

  private

  def lists_params
    params.require(:list).permit(:name)
  end
end
