require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:user)  { FactoryBot.create(:user) }
    # let(:product) { Product.create!(name: "race bike") }
    let(:product)  { FactoryBot.create(:product) }

    let(:comment) {FactoryBot.create(:comment)}
    # let(:user) { User.create!(first_name: "Sandy", last_name: "Khan", email: "sandy@email.com", password: "password") }
    # let(:comment) {FactoryBot.comment.create(:comment, rating: 1, user: user, body: "Awful bike")}
    # let(:comment) {FactoryBot.comment.create(:comment, rating: 3, user: user, body: "Ok bike!")}
    # let(:comment) {FactoryBot.comment.create(:comment, rating: 5, user: user, body: "Great bike!")}
      before do
        product.comments.create(rating: 1, user: user, body: "Awful bike")
        product.comments.create(rating: 3, user: user, body: "Ok bike!")
        product.comments.create(rating: 5, user: user, body: "Great bike!")
      end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3.0
    end
  end

  context "when the product is added without a name" do
    let(:product) { Product.new(description: "fantastic bike") }

    it "returns as an invalid entry" do
      expect(Product.new(description: "fantasic bike")).not_to be_valid
    end
  end

end
