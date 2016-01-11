require 'arduino_firmata'
require 'timeout'

module Lyrebird
  class ConnectionFailure < LyrebirdError; end
  class Harness
    attr_accessor :uploader
    def initialize(uploader)
      @uploader = uploader
    end

    #Programs the harness device with the firmata sketch
    def setup_device
      @uploader.upload_sketch File.dirname(__FILE__) +'/standard_firmata/standard_firmata.ino'
    end

    def connect
      Timeout::timeout(5, ConnectionFailure) do
        begin
          @board = ::ArduinoFirmata.connect uploader.port
          true
        rescue
          #convert the error into our own
          @board = nil
          raise ConnectionFailure
        end
      end
    end

    def disconnect
      if connected?
        @board.close
        @board = nil
      end
    end

    def connected?
      not @board.nil?
    end

    private
    attr_accessor :board
  end
end
