module Docker::Types
  class Container
    JSON.mapping(
      id: {key: "Id", type: String},
      names: {key: "Names", nilable: true, type: Array(String)},
      image: {key: "Image", nilable: true, type: String},
      image_id: {key: "ImageID", nilable: true, type: String},
      command: {key: "Command", nilable: true, type: String},
      created: {key: "Created", nilable: true, type: Int64},
      ports: {key: "Ports", nilable: true, type: Array(Hash(String, JSON::Any))},
      size_rw: {key: "SizeRw", nilable: true, type: Int32},
      size_root_fs: {key: "SizeRootFs", nilable: true, type: Int32},
      labels: {key: "Labels", nilable: true, type: Hash(String, String)},
      state: {key: "State", nilable: true, type: String},
      status: {key: "Status", nilable: true, type: String},
      network_settings: {key: "NetworkSettings", nilable: true, type: Hash(String, JSON::Any)},
    )
  end
end
