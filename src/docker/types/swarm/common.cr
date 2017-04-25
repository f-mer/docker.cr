module Docker::Types::Swarm
  class Version
    JSON.mapping(
      index: {key: "Index", nilable: true, type: Int32},
    )
  end
end
