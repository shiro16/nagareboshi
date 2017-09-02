# coding: utf-8

require 'spec_helper'

describe Nagareboshi::Configuration do
  context "default instance variable" do
    let(:configuration) { Nagareboshi::Configuration.new }
    it { expect(configuration.host).to eq "pubsubhubbub.appspot.com" }
    it { expect(configuration.send).to be_falsy }
    it { expect(configuration.use_ssl).to be_falsy }
  end
end
