class SimplePagesController < ApplicationController
  def index
    @featured_product = Product.first
    @products = Product.limit(3)

  end

  def show
    @user = current_user
  end

  def landing_page
    render layout: "landing_page"
  end

  # POST simple_pages/thank_you

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
