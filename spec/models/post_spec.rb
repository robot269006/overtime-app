require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    it "can be created" do
      post = Post.create(date: Date.today, rationale: "Anything")
      expect(post).to be_valid
    end
  end
end
