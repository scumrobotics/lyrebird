module Lyrebird
  class Uploader

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

    def program_sketch(path, port)
      throw ArgumentError unless valid_configuration?
    end

    private

    def valid_configuration?
      current_tool == :arduino and board == :uno
    end
  end
end
