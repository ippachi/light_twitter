require "spec_helper"
require '../hoge/key'

RSpec.describe LightTwitter do
  let(:user) {LightTwitter::User.new(CONSUMER_KEY, CONSUMER_SEACRET,
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

