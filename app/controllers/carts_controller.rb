class CartsController < ApplicationController
  def index
    @carts = current_user.carts.all
  end 
    
  def create
    @cart = current_user.carts.new(cart_params)
    if current_user.carts.find_by(list_id: params[:cart][:list_id]).present?
      cart = current_user.carts.find_by(list_id: params[:cart][:list_id])
      cart.amount += params[:cart][:amount].to_i
      cart.update(amount: cart.amount)
      redirect_to carts_path
    else
      @cart.save
      @carts = current_user.carts.all
      redirect_to carts_path
    end
  end
  
  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to carts_path
  end
  
  
  private
  
  def cart_params
    params.require(:cart).permit(:list_id, :amount, :user_id)
  end
end
