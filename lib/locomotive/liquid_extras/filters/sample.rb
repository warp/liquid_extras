module Locomotive
  module LiquidExtras
    module Filters
      module Sample

        def sample(input, number = nil)
          input = input.all if input.respond_to?(:all) # Content type collection
          if number
            input.sample(number)
          else
            input.sample
          end
        end

      end

      ::Liquid::Template.register_filter(Sample)
    end
  end
end
