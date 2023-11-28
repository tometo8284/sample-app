class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def index
    @categories = Category.all
    if params[:title].present?
       @lists = List.where('title LIKE(?)', "%#{params[:title]}")
    else
      @lists = List.page(params[:page]).order("created_at desc")
    end
  end

  def show
    @list = List.find(params[:id])
    @list_comment = ListComment.new
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
  
  def search
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @lists = @category.lists
    render "index"
  end
  
  private
    def list_params
      params.require(:list).permit(:category_id, :title, :body, :image, :price, :is_deleted)
    end
end
