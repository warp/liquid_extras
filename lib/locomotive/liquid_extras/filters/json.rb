require 'active_support/json'

module Locomotive
  module LiquidExtras
    module Filters
      module Json

        def json(object)
          object.to_json
        end

      end

      ::Liquid::Template.register_filter(Json)
    end
  end
end
