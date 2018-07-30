module Inflet::Container
  macro bind(type, &block)
    def self.resolve(type : {{type}}.class)
      {{yield}}
    end
  end

  macro included
    def self.resolve(type)
      type.new
    end
  end
end
