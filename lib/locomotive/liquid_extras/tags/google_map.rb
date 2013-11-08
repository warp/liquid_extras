require 'base64'
require 'active_support/core_ext'

module Locomotive
  module LiquidExtras
    module Tags

      # Google maps static image
      class GoogleMap < ::Liquid::Tag
        Syntax = /^#{::Liquid::QuotedFragment}+/

        def initialize(tag_name, markup, tokens, context)
          if markup =~ Syntax
            @params = options_from_string(markup)
          else
            raise SyntaxError.new("Syntax Error in 'map' - Valid syntax: map latitude:'LATITUDE', longitude:'LONGITUDE', size:'WIDTHxHEIGHT', scale:'SCALE'")
          end

          super
        end

        def render(context)
          google_static_maps_url render_params(context)
        end

      private

        def render_params(context)
          {}.tap do |options|
            @params.each do |key, value|
              options[key] = ::Liquid::Variable.new(value).render(context)
            end
          end
        end

        def options_from_string(markup)
          {}.tap do |options|
            markup.split(',').each do |param|
              param =~ /(#{::Liquid::VariableSignature}+):\s*(#{::Liquid::QuotedFragment}+)\s*/
              options[$1.to_sym] = $2
            end
          end
        end

        def google_static_maps_url(options)
          # Decode the key
          key = Base64.urlsafe_decode64 ENV['GOOGLE_MAPS_BUSINESS_KEY']

          # Build up the url to sign
          to_sign = '/maps/api/staticmap?' + {
            markers: "scale:#{options[:scale]}|#{options[:latitude]},#{options[:longitude]}",
            zoom: 15,
            size: options[:size],
            scale: options[:scale],
            sensor: false,
            client: ENV['GOOGLE_MAPS_BUSINESS_CLIENT_ID']
          }.to_query

          # Build the signature
          signature = Base64.urlsafe_encode64 OpenSSL::HMAC.digest('sha1', key, to_sign)

          # Return the google maps url
          "http://maps.googleapis.com#{to_sign}&signature=#{signature}"
        end

      end

      ::Liquid::Template.register_tag('google_map', GoogleMap)
    end
  end
end
