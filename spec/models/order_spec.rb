require 'rails_helper'

describe Order do

  context "when an order is created without being logged in" do

    let(:product) { Product.create!(name: "race bike") }
    let(:order) { Order.new(product: product, total: 1000.00)}

    it "does not create the order" do
      expect(Order.new(product: product, total: 1000.00)).not_to be_valid
    end

  end

end
