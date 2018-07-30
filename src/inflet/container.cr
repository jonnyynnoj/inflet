module Inflet::Container
  macro bind(type, &block)
    def self.resolve(type : {{type}}.class)
      {{yield}}
    end
  end
end
