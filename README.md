# Nagareboshi

Ruby PubSubHubbub Client

http://code.google.com/p/pubsubhubbub

## Installation

Add this line to your application's Gemfile:

    gem 'nagareboshi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nagareboshi

## Usage

Ruby settings

    Nagareboshi.configure do |config|
      config.send = true
    end

Rails settings send to production only

    Nagareboshi.configure do |config|
      config.send = Rails.env.production?
    end

send http://example.com/

    Nagareboshi::Sender.publish("http://example.com/")

send many url

    Nagareboshi::Sender.publish(["http://example.com/", "http://example.com/1"])

