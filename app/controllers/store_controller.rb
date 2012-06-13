class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @products=Product.order(:title)
    session[:counter]||=0
    @count=session[:counter]+=1
    @cart=current_cart
    
  end
  
  
end

