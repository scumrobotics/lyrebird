
module Lyrebird
  class Harness
    attr_accessor :uploader
    def initialize(uploader)
      @uploader = uploader
    end

    #Programs the harness device with the firmata sketch
    def setup_device
      @uploader.upload_sketch File.dirname(__FILE__) +'/standard_firmata/standard_firmata.ino'
    end
  end
end
