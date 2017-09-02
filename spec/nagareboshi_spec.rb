require 'spec_helper'

describe Nagareboshi do
  it 'should have a version number' do
    expect(Nagareboshi::VERSION).to_not be_nil
  end

  context 'configure set host send use_ssl port' do
    before do
      Nagareboshi.configure do |config|
        config.host    = 'localhost'
        config.send    = true
        config.use_ssl = false
        config.port    = 3000
      end
    end

    it { expect(Nagareboshi.configuration.host).to eq 'localhost' }
    it { expect(Nagareboshi.configuration.send).to be_truthy }
    it { expect(Nagareboshi.configuration.use_ssl).to be_falsy }
    it { expect(Nagareboshi.configuration.port).to eq 3000 }
  end
end
