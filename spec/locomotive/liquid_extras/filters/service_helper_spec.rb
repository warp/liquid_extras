require 'spec_helper'

describe Locomotive::LiquidExtras::Filters::ServiceHelper do

  include Locomotive::LiquidExtras::Filters::ServiceHelper

  it 'return the uri for a service' do
    uri_for_api('centre', 'centres').to_s.should match(%r{http://centre-service.[^/]+/api/centre/master/centres})
  end

end
