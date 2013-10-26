require 'spec_helper'

describe Locomotive::LiquidExtras::Filters::UrlEncode do

  include Locomotive::LiquidExtras::Filters::UrlEncode

  describe '#url_encode' do

    it 'returns a URL encoded string' do
      url_encode('https://twitter.com/share?url=http://website.com/subdir&text=this is text').should eq("https%3A%2F%2Ftwitter.com%2Fshare%3Furl%3Dhttp%3A%2F%2Fwebsite.com%2Fsubdir%26text%3Dthis%20is%20text")
    end

  end

end
