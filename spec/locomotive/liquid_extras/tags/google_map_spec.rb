require 'spec_helper'

describe Locomotive::LiquidExtras::Tags::GoogleMap do

  let(:markup)  { 'key:value' }
  let(:tokens)  { double(:tokens) }
  let(:context) { double(:tokens) }
  subject { described_class.new('google_map', markup, tokens, context) }

  describe '#options_from_string' do
    it 'should parse out options' do
      subject.send(:options_from_string, "latitude:121, longitude:415, size:'640x480', scale:1").should eql(
        {latitude: '121', longitude: '415', size: "'640x480'", scale: '1'}
      )
    end
  end

  describe '#google_static_maps_url' do
    before do
      ENV['GOOGLE_MAPS_BUSINESS_KEY'] = 'deadbeef'
      ENV['GOOGLE_MAPS_BUSINESS_CLIENT_ID'] = '12345'
    end

    it 'should render static map url' do
      subject.send(:google_static_maps_url, {latitude: 121, longitude: 415, size: '640x480', scale: 1}).should eql(
        'http://maps.googleapis.com/maps/api/staticmap?client=12345&markers=scale%3A1%7C121%2C415&scale=1&sensor=false&size=640x480&zoom=15&signature=Hxnk5E7ntYaCi00on6HYPWHAN-c='
      )
    end
  end
end
