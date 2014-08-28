module Nagareboshi
  module Sender
    class << self
      
      def publish(urls)
        urls = [urls] if urls.is_a?(String)
        body = urls.map do |url|
          URI.encode_www_form({'hub.mode' => 'publish', 'hub.url' => url})
        end.join('&')
        shooting_star(body)
      end

      private
      def shooting_star(body)
        request = Net::HTTP::Post.new(URI(uri))
        request.body = body
        headers.each { |k, v| request[k.to_s] = v.to_s}
        ☆(request) if send?
      end

      def ☆(request)
        http = Net::HTTP.new(Nagareboshi.configuration.host, ssl? ? 443 : 80)
        http.use_ssl = ssl?
        response = http.start do |http|
          http.request request
        end
      end

      def headers
        {"User-Agent" => "Nagareboshi Ruby Library v#{VERSION}", "Content-Type" => "application/x-www-form-urlencoded"}
      end

      def send?
        Nagareboshi.configuration.send == true
      end

      def uri
        "#{ssl? ? 'https' : 'http'}://#{Nagareboshi.configuration.host}/publish"
      end

      def ssl?
        Nagareboshi.configuration.use_ssl == true
      end
    end
  end
end
