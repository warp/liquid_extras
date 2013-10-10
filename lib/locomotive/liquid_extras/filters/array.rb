module Locomotive
  module LiquidExtras
    module Filters
      module Array

        def sample(array)
          array.sample
        end

      end

      ::Liquid::Template.register_filter(Array)
    end
  end
end
