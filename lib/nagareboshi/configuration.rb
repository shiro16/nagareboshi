module Nagareboshi
  class Configuration
    attr_accessor :host, :send, :use_ssl

    def initialize
      @host    = "pubsubhubbub.appspot.com"
      @send    = false
      @use_ssl = false
    end
  end
end
