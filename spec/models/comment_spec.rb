require 'rails_helper'

describe Comment do

  context "when a comment is created without a body" do
    let(:comment)  { FactoryBot.build(:comment, rating: 3) }

    it "does not create the comment" do
      expect(comment).not_to be_valid
    end
  end



end
