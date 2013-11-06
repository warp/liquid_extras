module Locomotive
  module LiquidExtras
    module Filters
      module Header

        def header(input)
          header = @context.registers[:request].env[input]
          header && header == 'true'
        end

      end

      ::Liquid::Template.register_filter(Header)
    end
  end
end
