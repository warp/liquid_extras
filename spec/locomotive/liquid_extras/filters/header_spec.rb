require 'spec_helper'

describe Locomotive::LiquidExtras::Filters::Header do

  include Locomotive::LiquidExtras::Filters::Header

  describe '#header' do

    before :each do
      @context = double(:context, registers: {request: double(env: {'HTTP_X_MOBILE' => http_header})})
    end

    describe 'http header true' do
      let(:http_header) { 'true' }
      it { header('HTTP_X_MOBILE').should be_true }
    end

    describe 'http header false' do
      let(:http_header) { 'false' }
      it { header('HTTP_X_MOBILE').should be_false }
    end

    describe 'http header empty' do
      let(:http_header) { nil }
      it { header('HTTP_X_MOBILE').should be_false }
    end

  end

end
