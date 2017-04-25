module Docker
  class Configuration
    property address

    def initialize(@address = "unix:///var/run/docker.sock")
    end
  end
end
