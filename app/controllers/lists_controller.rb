class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def index
    @lists = List.all.order("created_at desc")
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list.id)
    else 
      redirect_to lists_path
    end
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to lists_path
  end  
  
  private
  
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
