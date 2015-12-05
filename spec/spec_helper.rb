$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'lyrebird'

def master_board
  '/dev/ttyACM0'
end


def sketch_path(name)
  "spec/sketches/#{name}/#{name}.ino"
end
