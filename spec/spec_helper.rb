$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'lyrebird'

def harness_port
  '/dev/ttyACM0'
end


def sketch_path(name)
  "spec/sketches/#{name}/#{name}.ino"
end
