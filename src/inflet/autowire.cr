module Inflet::Autowire(C)
  macro included
    macro finished
      def C.resolve(type : {{@type}}.class)
        \{% method = @type.methods.find { |m| m.name == "initialize" } %}

        \{% if !method || method.args.size == 0 %}
          return type.new
        \{% end %}

        \{% if method %}
          type.new(
            \{% for arg in method.args %}
              \{{arg.name.id}}: self.resolve(\{{arg.restriction}}),
            \{% end %}
          )
        \{% end %}
      end
    end
  end
end
