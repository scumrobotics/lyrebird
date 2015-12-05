require 'spec_helper'

describe Lyrebird::Uploader do
  before(:each) do
    @uploader = Lyrebird::Uploader.new
  end

  describe '#current_tool' do
    it 'is accessible' do
      expect(@uploader.respond_to? :current_tool).to be true
    end

    it 'can be set' do
      @uploader.current_tool = :spanner
      expect(@uploader.current_tool).to be :spanner
    end

    it 'defaults to arduino' do
      expect(@uploader.current_tool).to be :arduino
    end
  end

  describe '#board' do
    it 'is accessible' do
      expect(@uploader.respond_to? :board).to be true
    end

    it 'can be set' do
      @uploader.board = :plywood
      expect(@uploader.board).to be :plywood
    end

    it 'defaults to UNO' do
      expect(@uploader.board).to be :uno
    end
  end

  describe '#upload_sketch' do
    context 'when current tool is not recognised' do
      it 'raises an ArgumentError' do
        @uploader.current_tool = :hammer
        expect{@uploader.upload_sketch('spec/sketches/blink/blink.ino', master_board)}.to raise_error ArgumentError
      end
    end

    context 'when board is not recognised' do
      it 'raises an ArgumentError' do
        @uploader.board = :cheese
        expect{@uploader.upload_sketch('spec/sketches/blink/blink.ino', master_board)}.to raise_error ArgumentError
      end
    end

    context 'when sketch cannot be found' do
      it 'raises an ArgumentError' do
        expect{@uploader.upload_sketch('spec/sketches/no_such_sketch.ino', master_board)}.to raise_error ArgumentError
      end
    end

    context 'when sketch fails to upload' do
      #make it fail by trying to program a non-existent board
      it 'raises a SketchFailError' do
        expect{@uploader.upload_sketch('spec/sketches/blink/blink.ino', '/dev/no_such_device')}.to raise_error Lyrebird::SketchFailError
      end
    end
  end
end
