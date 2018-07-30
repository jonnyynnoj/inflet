# Inflet

Inflet is a dependency injection container for [Crystal](https://github.com/crystal-lang/crystal)

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  container:
    github: jonnyynnoj/inflet
```

## Usage

Services can be bound into the container with `#bind` and later retrieved with `#resolve`:

```crystal
require "inflet"

module Container
  include Inflet::Container

  bind(Foo) do
    Foo.new("bar")
  end
end

class Foo
  getter value

  def initialize(@value : String)
  end
end

foo = Container.resolve(Foo)
p foo.value # "bar"
```

Services can also be 'autowired' in which case the container will attempt to inject any dependencies automatically:

```crystal
class Bar
  include Inflet::Autowire(Container)
  getter foo, baz

  def initialize(@foo : Foo, @baz : Baz)
  end
end

class Baz
end

bar = Container.resolve(Bar)
p typeof(bar.foo) # Foo
p bar.foo.value # "bar"
p typeof(bar.baz) # Baz
```

## Development

Run tests:

```
crystal spec
```
