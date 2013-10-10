require 'spec_helper'

describe Locomotive::LiquidExtras::Filters::Json do

  include Locomotive::LiquidExtras::Filters::Json

  describe '#json' do

    it 'returns a json string' do
      json({a: 'b'}).should eq("{\"a\":\"b\"}")
    end

  end

end
