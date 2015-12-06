require 'pathname'
require 'open3'

module Lyrebird
  class SketchFailError < StandardError; end

  class Uploader
    attr_accessor :port
    attr_writer :current_tool, :board

    def current_tool
      @current_tool || default_tool
    end

    def default_tool
      :arduino
    end

    def board
      @board || default_board
    end

    def default_board
      :uno
    end

    def upload_sketch(path)
      sketch = Pathname.new(path)
      check_arguments(sketch)

      # using info from https://github.com/arduino/Arduino/blob/ide-1.5.x/build/shared/manpage.adoc
      command = ["arduino", "--board", "arduino:avr:uno", "--port", port, "--upload", sketch.to_s]
      run_tool(command)
    end

    def verified?(path)
      sketch = Pathname.new(path)
      check_arguments(sketch)

      command = ["arduino", "--verify", sketch.to_s]
      begin
        run_tool(command)
      rescue
        false
      else
        true
      end
    end

    private

    def valid_configuration?
      current_tool == :arduino and board == :uno
    end

    def check_arguments(sketch)
      raise ArgumentError, "Bad configuration" unless valid_configuration?
      raise ArgumentError, "Sketch not found" unless sketch.exist?
      raise ArgumentError, "Port not set" if port.nil? or port.empty?
    end

    def run_tool(command)
      status = nil
      output = "Output:\n"
      Open3.popen2e(*command) {|i, oe, t|
        output << oe.read
        status = t.value
      }
      raise SketchFailError, output unless status.success?

      #the arduino program sometimes doesnt give the right error code (gah) - check the output
      raise SketchFailError, output if output.match(/^Global variables use.+?$\n./m) #anything past this line of output means there was a problem
    end

  end
end
