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
end
