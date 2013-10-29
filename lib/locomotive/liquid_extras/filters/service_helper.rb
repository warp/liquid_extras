require 'service_helper'

module Locomotive
  module LiquidExtras
    module Filters
      module ServiceHelper

        def uri_for_api(service, path)
          WestfieldUri::Service.uri_for_api(service, 'http', 'master', path)
        end

      end

      ::Liquid::Template.register_filter(ServiceHelper)
    end
  end
end
