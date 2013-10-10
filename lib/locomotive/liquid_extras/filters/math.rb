module Locomotive
  module LiquidExtras
    module Filters
      module Math

        def round(input, digits = 0)
          input.to_f.round(digits)
        end

      end

      ::Liquid::Template.register_filter(Math)
    end
  end
end
