require 'uri'

module Locomotive
  module LiquidExtras
    module Filters
      module UrlEncode

        def url_encode(url)
          return URI.escape(url, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
        end

      end

      ::Liquid::Template.register_filter(UrlEncode)
    end
  end
end
