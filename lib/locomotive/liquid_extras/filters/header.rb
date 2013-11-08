module Locomotive
  module LiquidExtras
    module Filters
      module Header

        def header(input)
          header = ENV[input] || env[input]
          header && header == 'true'
        end

      private

        def env
          (@context.registers[:controller] || @context.registers[:request]).env
        end
      end

      ::Liquid::Template.register_filter(Header)
    end
  end
end
