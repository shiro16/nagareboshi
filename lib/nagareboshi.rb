require 'net/http'
require 'net/https'

module Nagareboshi
  module_function
  def self.configure(&block)
    yield(configuration)
  end

  def configuration
    @_configuration ||= Configuration.new
  end
end

require 'nagareboshi/version'
require 'nagareboshi/configuration'
require 'nagareboshi/sender'
