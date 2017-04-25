module Docker
  class Connection
    delegate get, post, put, patch, head, to: ressource

    def initialize(url)
      @url = URI.parse(url)
    end

    private def ressource
      if unix?
        HTTP::Client.unix(@url.to_s.sub(/^unix:\/\//, ""))
      else
        HTTP::Client.new(@url.host.not_nil!, @url.port.not_nil!)
      end
    end

    private def unix?
      @url.scheme == "unix"
    end
  end
end
