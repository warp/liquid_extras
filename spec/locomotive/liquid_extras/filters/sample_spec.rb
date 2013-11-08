require 'spec_helper'

describe Locomotive::LiquidExtras::Filters::Sample do

  include Locomotive::LiquidExtras::Filters::Sample

  describe '#sample' do
    it 'return a sample of an array' do
      array = ["Foo", "Bar", "Locomotive"]
      (array - sample(array, 1)).size.should eql 2
    end
  end

  describe '#sample_unique' do
    it 'return a unique sample of an array' do
      array = ["Foo", "Bar", "Locomotive"]
      set = Set.new()
      3.times { set << sample_unique(array) }
      set.size.should eql 3
    end
  end
end
