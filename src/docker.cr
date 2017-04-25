require "json"
require "http"
require "./core_ext/**"
require "./docker/**"

module Docker
  @@configuration = Configuration.new

  def self.configure(&blk)
    yield @@configuration
  end

  def self.configuration
    @@configuration
  end

  def self.connection
    Connection.new(configuration.address)
  end
end
