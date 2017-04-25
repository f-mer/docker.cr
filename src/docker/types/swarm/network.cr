module Docker::Types::Swarm
  class Endpoint
    JSON.mapping(
      spec: {key: "Spec", nilable: true, type: EndpointSpec},
      ports: {key: "Ports", nilable: true, type: PortConfig},
      virtual_ips: {key: "VirtualIPs", nilable: true, type: EndpointVirtualIP},
    )
  end

  class EndpointSpec
    JSON.mapping(
      mode: {key: "Spec", nilable: true, type: String},
      ports: {key: "Ports", nilable: true, type: Array(PortConfig)},
    )
  end

  class PortConfig
    JSON.mapping(
      name: {key: "Name", nilable: true, type: String},
      protocol: {key: "Protocol", nilable: true, type: String},
      target_port: {key: "TargetPort", nilable: true, type: UInt32},
      published_port: {key: "PublishedPort", nilable: true, type: UInt32},
      published_mode: {key: "PublishedMode", nilable: true, type: String}
    )
  end

  class EndpointVirtualIP
    JSON.mapping(
      network_id: {key: "NetworkID", nilable: true, type: String},
      addr: {key: "Addr", nilable: true, type: String},
    )
  end
end
