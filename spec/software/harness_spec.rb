require 'spec_helper'

describe Lyrebird::Harness do
  before(:each) do
    @uploader = Lyrebird::Uploader.new
    @uploader.port = 'fake_port'

    @harness = Lyrebird::Harness.new(@uploader)

  end

  describe "#setup_device" do
    context "when board is not present" do
      it "raises an error" do
        expect{@harness.setup_device}.to raise_error Lyrebird::SketchFailError
      end
    end
  end

  describe "#connect" do
    context "when board is not present" do
      it "times out and raises an error" do
        expect{@harness.connect}.to raise_error Lyrebird::ConnectionFailure
      end
    end
  end

  describe "#connected?" do
    context "when board has not been connected" do
      it "returns false" do
        expect(@harness.connected?).to be false
      end
    end
  end
end
