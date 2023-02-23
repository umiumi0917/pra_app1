class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def index
    @list = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render:new
    end
  end

  def destory
    list = List.find(list.id)
    list.destroy
    redirect_to '/lists'
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
