module HTTP
  class Client
    @socket : UNIXSocket | TCPSocket | OpenSSL::SSL::Socket | Nil

    def self.unix(path)
      client = new("localhost")
      client.socket = UNIXSocket.new(path)
      client
    end

    def socket=(socket : IO)
      @socket = socket
    end
  end
end
