require 'spec_helper'

describe Lyrebird::Harness do
  before(:each) do
    @uploader = Lyrebird::Uploader.new
    @uploader.port = harness_port

    @harness = Lyrebird::Harness.new(@uploader)
  end

  describe '#setup_device' do
    context 'when device is present' do
      it 'runs without error' do
        expect{@harness.setup_device}.to_not raise_error
      end
    end
  end
end
