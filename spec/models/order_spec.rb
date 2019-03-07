require 'rails_helper'

describe Order do

  context "when an order is created when not logged in" do
    # let(:product) { Product.create!(name: "race bike") }
    let(:product)  { FactoryBot.build(:product) }
    # let(:order) { Order.new(product: product, total: 1000.00)}
    let(:order)  { FactoryBot.build(:order) }

    it "does not create the order" do
      # expect(Order.new(product: product, total: 1000.00)).not_to be_valid
      expect(Order.new).not_to be_valid
    end

  end

end
