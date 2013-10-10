require 'spec_helper'

describe Locomotive::LiquidExtras::Filters::Math do

  include Locomotive::LiquidExtras::Filters::Math

  describe '#round' do

    it 'returns rounded float' do
      round('3.14').should eql(3)
      round(Math::PI, 2).should eql(3.14)
    end

  end

end
