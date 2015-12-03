module Lyrebird
  class Uploader

    attr_writer :current_tool

    def current_tool
      @current_tool || default_tool
    end

    def default_tool
      :arduino
    end
  end
end
