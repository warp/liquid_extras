module Locomotive
  module LiquidExtras
    module Tags

      class CheckIfMobile < ::Liquid::Tag
        def render(context)
          context.scopes.last['mobile'] = is_mobile? context
          ''
        end

        def is_mobile?(context)
            request(context).host.to_s.split('.').first == 'm' || !!(ENV['FORCE_MOBILE'] =~ /true/i)
        end

        def request(context)
          if context.registers.has_key? :controller
            context.registers[:controller].request
          else
            context.registers[:request]
          end
        end
      end

      ::Liquid::Template.register_tag('check_if_mobile', CheckIfMobile)
    end
  end
end
