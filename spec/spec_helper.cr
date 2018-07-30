require "spec"
require "../src/inflet"

module Container
  include Inflet::Container

  bind(BoundService) do
    BoundService.new("test")
  end
end

class BoundService
  getter prop : String

  def initialize(@prop)
  end
end

class AutowiredService
  include Inflet::Autowire(Container)
  getter foo, bound_service

  def initialize(@foo : Foo, @bound_service : BoundService)
  end
end

class Foo
end
