module Nagareboshi
  class Configuration
    attr_accessor :host, :send, :use_ssl, :port, :path

    def initialize
      @host    = "pubsubhubbub.appspot.com"
      @send    = false
      @use_ssl = false
      @port    = nil
      @path    = 'publish'
    end
  end
end
