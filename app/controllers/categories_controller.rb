class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new 
  end
  def create
    @category = Category.new(category_params)
    if @category.save
       redirect_to genres_path
    else     
      @categories = Category.all
      render 'index'
    end
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
end
