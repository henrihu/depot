class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
    visit_count_increase
  end

  private
    # increase the visit count and save in session
    def visit_count_increase
      if session[:visit_count].nil?
        session[:visit_count] = 0
      else
        session[:visit_count] += 1
      end
    end
end
