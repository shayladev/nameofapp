class PaymentsController < ApplicationController
# skip_before_action :verify_authenticity_token
before_action :authenticate_user!, only: [:create]


  def create

    @product = Product.find(params[:product_id])
    @user = current_user

    token = params[:stripeToken]
      # Create the charge on Stripe's servers - this will charge the user's card
      begin
        charge = Stripe::Charge.create(
          amount: @product.price.to_i ,
          currency: "cad",
          source: token,
          description: params[:stripeEmail],
          receipt_email: params[:stripeEmail]
        )

      if charge.paid
        Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
      else
        flash[:error] = "Unfortunately, there was an error processing your payment."
      end

      rescue Stripe::CardError => e
        # The card has been declined
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      end

      redirect_to product_path(@product), notice: "Thank you for your purchase."


      # ActionMailer::Base.mail(from: @user.email,
      #     to: 'your-email@example.com',
      #     subject: "Thank you for your order #{@user.first_name}",
      #     body: "Product ordered: #{@product.name}").deliver_now
      UserMailer.order_placed(@user).deliver_now

  end


end
