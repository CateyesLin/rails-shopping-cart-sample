class CartsController < ApplicationController
  def add
    current_cart.add_item(params[:id])
    session[:cart] = current_cart.serialize

    redirect_to session.delete(:return_to), notice: "已加入購物車"
  end

  def destroy
    session[:cart] = nil
    redirect_to user_path(current_user.id), notice: "購物車已清空"
  end
end
