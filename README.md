# docker.cr ![stability][0]

This shard provides an object oriented interface to the [Docker Remote API](https://docs.docker.com/engine/api/).

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  docker:
    github: f-mer/docker.cr
```

## Usage

```crystal
require "docker"

Docker.configure do |config|
  #config.address = "tcp://localhost:2376"
  config.address = "unix:///var/run/docker.sock"
end

puts Docker::Container.all.inspect

# swarm mode has to be enabled
puts Docker::Service.all.inspect
```

## API

### `Docker.configure(&blk : Proc(config : Docker::Configuration))
Configures the default connection object.

### `Docker::Container.all(all : Bool, limit : Int32?, since : String?, before : String?, size : Bool, filters : String => Array(String))`
[/containers/json](https://docs.docker.com/engine/api/v1.28/#operation/ContainerList)

Queries containers

### `Docker::Service.all(id : Int32?, label : String?, name : String?)`
[/services](https://docs.docker.com/engine/api/v1.28/#operation/ServiceList)

Queries swarm services

## License
[MIT](https://tldrlegal.com/license/mit-license)

[0]: https://img.shields.io/badge/stability-experimental-orange.svg?style=flat-square
