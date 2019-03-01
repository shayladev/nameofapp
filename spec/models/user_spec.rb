require 'rails_helper'

describe User do

  context "when a new user is  created without an email" do

    let(:user) { User.new(password: "password") }

  end

  it "does not create new user" do
    expect(User.new(password: "password")).not_to be_valid
  end

end
