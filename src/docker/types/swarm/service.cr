module Docker::Types::Swarm
  class Service
    JSON.mapping(
      id: {key: "ID", type: String},
      version: {key: "Version", type: Version},
      created_at: {key: "CreatedAt", nilable: true, type: Time},
      updated_at: {key: "UpdatedAt", nilable: true, type: Time},
      spec: {key: "Spec", nilable: true, type: Swarm::ServiceSpec},
      endpoint: {key: "Endpoint", nilable: true, type: Swarm::Endpoint},
    )
  end

  class ServiceSpec
    JSON.mapping(
      name: {key: "Name", nilable: true, type: String},
      endpoint_spec: {key: "EndpointSpec", nilable: true, type: EndpointSpec}
    )
  end
end
