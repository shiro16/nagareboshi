# coding: utf-8

require 'spec_helper'

describe Nagareboshi::Sender do
  let(:url) { "http://localhost/" }
  let(:sender) { Nagareboshi::Sender }
  before do
    Nagareboshi.configure do |config|
      config.host    = "localhost"
      config.send    = true
      config.use_ssl = false
    end
    stub_request(:post, url).to_return(status: 200)
  end

  context "publish" do
    it "called shooting star" do
      expect(sender).to receive(:shooting_star).with("hub.mode=publish&hub.url=test")
      expect(sender.publish("test")).to be_nil
    end
    it "return HTTPOK" do
      expect(sender.publish("test")).to be_an_instance_of(Net::HTTPOK)
    end
  end
  
  describe "private methods" do
    context "shooting_star" do
      subject { sender.send(:shooting_star, "test") }
      context "send? is true" do
        it "return HTTPOK" do
          expect(subject).to be_an_instance_of(Net::HTTPOK)
        end

        it "called ☆" do
          expect(sender).to receive(:☆).with(Net::HTTP::Post)
          expect(subject).to be_nil
        end
      end

      it "send? is false" do
        allow(sender).to receive(:send?).and_return(false)
        expect(sender).to_not receive(:☆)
        expect(subject).to be_nil
      end
    end

    context "☆" do
      subject { sender.send(:☆, Net::HTTP::Post.new(URI(url))) }
      it { expect(subject).to be_an_instance_of(Net::HTTPOK) }
    end

    context "headers" do
      subject { sender.send(:headers) }

      it { expect(subject).to eq({"User-Agent" => "Nagareboshi Ruby Library v#{Nagareboshi::VERSION}", "Content-Type" => "application/x-www-form-urlencoded"}) }
    end

    context "send?" do
      subject { sender.send(:send?) }

      it "send is true" do
        expect(subject).to be_truthy
      end

      it "send is false" do
        allow(sender).to receive(:send?).and_return(false)
        expect(subject).to be_falsy
      end
    end

    context "uri" do
      subject { sender.send(:uri) }

      it "ssl? is true" do
        allow(sender).to receive(:ssl?).and_return(true)
        expect(subject).to eq "https://localhost/"
      end

      it "ssl? is false" do
        expect(subject).to eq "http://localhost/"
      end
    end

    context "ssl?" do
      subject { sender.send(:ssl?) }
      
      it "use_ssl is true" do
        allow(Nagareboshi.configuration).to receive(:use_ssl).and_return(true)
        expect(subject).to be_truthy
      end

      it "user_ssl is false" do
        expect(subject).to be_falsy
      end
    end
  end
end
