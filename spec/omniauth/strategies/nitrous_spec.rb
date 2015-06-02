require 'spec_helper'
require_relative '../../../lib/omniauth/strategies/nitrous'

describe OmniAuth::Strategies::Nitrous do
  subject do
    OmniAuth::Strategies::Nitrous.new({})
  end

  context "client options" do
    it "should have correct site" do
      subject.options.client_options.site.should eq("https://pro.nitrous.io")
    end
  end
end