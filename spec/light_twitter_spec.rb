require "spec_helper"

CONSUMER_KEY = "ifVtTNrqg5bexhAcKeI8WBxEK"
CONSUMER_SECRET = "qhHckNy69xWYfMk2VJFKPJUtZNyLt1A5oftHaDF1GKBDYBbIEC"
ACCESS_TOKEN = "2503730593-E7ZYDv83lWnAExs8OjNt8jCzFnf8ldu6FUUmq4e"
ACCESS_SEACRET = "TAYlLQv66ZqV3Kvp95HDOt44RD3jnvXvHAgrzFjqGoGkJ"

RSpec.describe LightTwitter do
  let(:user) {LightTwitter::User.new(CONSUMER_KEY, CONSUMER_SECRET,
                                      ACCESS_TOKEN, ACCESS_SEACRET)}

  describe "timeline" do
    describe "#home_timeline" do
      it "returns array" do
        expect(user.home_timeline[0][:created_at]).to eq Array
      end

      it "returns array" do
        expect(user.home_timeline.class).to eq Array
      end

    end 

    describe "#mentions_timeline" do
      it "returns array" do
        expect(user.mentions_timeline.class).to eq Array
      end
    end 

    describe "#user_timeline" do
      it "returns array" do
        expect(user.user_timeline.class).to eq Array
      end
    end 
  end
end

