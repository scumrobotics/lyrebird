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

  describe '#program_sketch' do
    context 'when current tool is not recognised' do
      it 'throws an exception' do
        @uploader.current_tool = :hammer
        expect{@uploader.program_sketch('/dev/ttyAMC0', 'sketches/blink.ino')}.to raise_error ArgumentError
      end
    end

    context 'when board is not recognised' do
      it 'throws an exception' do
        @uploader.board = :cheese
        expect{@uploader.program_sketch('/dev/ttyAMC0', 'sketches/blink.ino')}.to raise_error ArgumentError
      end
    end
  end
end
