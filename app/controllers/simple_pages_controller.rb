class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_product = Product.first
    @products = Product.limit(3)
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
