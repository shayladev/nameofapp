require 'rails_helper'

describe Comment do

  context "when a comment is created without a body" do
    let(:user)  { FactoryBot.create(:user) }
    let(:product)  { FactoryBot.create(:product) }
    let(:comment)  { FactoryBot.build(:comment, rating: 3, user: user ) }

    it "does not create the comment" do
      expect(comment).not_to be_valid
    end
  end

  context "when a comment is created without a user" do
    let(:product)  { FactoryBot.create(:product) }
    let(:comment)  { FactoryBot.build(:comment, rating: 3, body: "this is a comment", product: product) }

    it "does not create the comment" do
      expect(comment).not_to be_valid
    end

  end

  context "when a comment is created without a product" do
    let(:user)  { FactoryBot.create(:user) }
    let(:comment)  { FactoryBot.build(:comment, rating: 3, user: user, body: "This is a comment" ) }

    it "does not create the comment" do
      expect(comment).not_to be_valid
    end
  end

  context "when a comment is created without a rating" do
    let(:user)  { FactoryBot.create(:user) }
    let(:product)  { FactoryBot.create(:product) }
    let(:comment)  { FactoryBot.build(:comment, user: user, body:"this is a comment" ) }

    it "does not create the comment" do
      expect(comment).not_to be_valid
    end
  end


end
