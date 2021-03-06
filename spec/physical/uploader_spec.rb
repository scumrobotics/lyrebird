require 'spec_helper'

describe Lyrebird::Uploader do
  before(:each) do
    @uploader = Lyrebird::Uploader.new
  end

  describe '#upload_sketch' do
    context 'when sketch successfully uploads' do
      it 'doesnt raise an error' do
        expect{@uploader.upload_sketch('spec/sketches/blink/blink.ino', master_board)}.to_not raise_error
      end
    end
  end

end
