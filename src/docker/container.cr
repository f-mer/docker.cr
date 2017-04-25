module Docker
  class Container
    delegate id, names, image, image_id, command, created, ports, size_rw,
      size_root_fs, labels, state, status, network_settings, to: @type

    def initialize(@connection : Connection, @type : Types::Container)
    end

    def self.all(all : Bool = false,
                 limit : Int32? = nil,
                 since : String? = nil,
                 before : String? = nil,
                 size : Bool = false,
                 filters = {} of String => Array(String),
                 connection = Docker.connection)
      params = HTTP::Params.build do |qs|
        qs.add "all", all.to_s
        qs.add "limit", limit.to_s
        qs.add "since", since
        qs.add "before", before
        qs.add "size", size.to_s
        qs.add "filters", filters.to_json
      end
      json = connection.get("/containers/json?#{params}").body

      Array(Types::Container).from_json(json).map do |ct|
        new connection, ct
      end
    end

    def start
      post("/containers/#{@type.id}/start")
    end

    def stop(wait = 5)
      post("/containers/#{@type.id}/stop?t=#{wait}")
    end

    def restart(wait = 5)
      post("/containers/#{@type.id}/restart?t=#{wait}")
    end

    def kill
      post("/containers/#{@type.id}/kill")
    end
  end
end
