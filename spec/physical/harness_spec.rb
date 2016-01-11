require 'spec_helper'

describe Lyrebird::Harness do
  before(:each) do
    @uploader = Lyrebird::Uploader.new
    @uploader.port = harness_port

    @harness = Lyrebird::Harness.new(@uploader)
  end

  after(:each) do
    @harness.disconnect
  end


  describe '#setup_device' do
    context 'when device is present' do
      it 'runs without error' do
        expect{@harness.setup_device}.to_not raise_error
      end
    end

    context 'when previous connect attempt failed' do
      it 'finishes without error' do
        skip "Breaks tests: Will not fix" do
          uploader = Lyrebird::Uploader.new(harness_port)
          uploader.upload_sketch sketch_path('blink')
          begin
            @harness.connect
          rescue
          end
          expect{@harness.setup_device}.to_not raise_error
        end
      end
    end
  end

  describe '#connect' do
    context "when device has been set up" do
      it "runs without error" do
        @harness.setup_device
        expect{@harness.connect}.to_not raise_error
        @harness.disconnect
      end
    end

    context "when device has not been set up with the correct sketch" do
      it "raises an error" do
        skip "Breaks tests: Will not fix" do
          uploader = Lyrebird::Uploader.new(harness_port)
          uploader.upload_sketch sketch_path('blink')
          expect{@harness.connect}.to raise_error Lyrebird::ConnectionFailure
        end
      end
    end
  end

  describe "#connected?" do
    context "when device is connected" do
      it "returns true" do
        @harness.setup_device
        @harness.connect
        expect(@harness.connected?).to be true
      end
    end
  end

  describe "#disconnect" do
    context "when device is connected" do
      it "no longer reports as connected" do
        @harness.setup_device
        @harness.connect

        @harness.disconnect
        expect(@harness.connected?).to be false
      end
    end
  end
end
