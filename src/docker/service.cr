module Docker
  class Service
    delegate id, version, created_at, updated_at, spec, endpoint, to: @type

    def initialize(@connection : Connection, @type : Types::Swarm::Service)
    end

    def self.all(id : Int32? = nil,
                 label : String? = nil,
                 name : String? = nil,
                 connection = Docker.connection)
      params = HTTP::Params.build do |qs|
        qs.add "id", id.to_s
        qs.add "label", label
        qs.add "name", name
      end
      json = connection.get("/services?#{params}").body

      Array(Types::Swarm::Service).from_json(json).map do |st|
        new connection, st
      end
    end
  end
end
