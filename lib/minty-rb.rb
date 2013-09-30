require 'net/http'
require 'uri'
require 'yaml'

module MintyRb
  class Binder
    def initialize file
      @scope ||= "default"
      @config = YAML.load_file(file)[@scope]
    end

    def bind identifier, options
      options.each_pair do |key, value|
        run identifier, key.to_s, value
      end
    end

    private

    def run identifier, key, value
      http = Net::HTTP.new(@config['host'], @config['port'])
      http.use_ssl = @config['use_ssl']
      request = Net::HTTP::Put.new [
        @config['path'],
        URI.escape(identifier),
        URI.escape(key),
        URI.escape(value),
      ].join('/')
      response = http.request(request)

      if response.code == "200"
        response.body
      end
    end
  end

  class Minter
    def initialize file
      @scope ||= "default"
      @config = YAML.load_file(file)[@scope]
    end

    def mint
      run
    end

    private

    def run
      uri = URI.parse(@config['host'])
      response = Net::HTTP.post_form(uri, query)

      if response.code == "200"
        parse_identifier response.body
      end
    end

    def query
      {shoulder: @config['shoulder']}
    end

    def parse_identifier(body)
      identifier = /id:\s+(\S+)/.match(body)[1]
      if @config['elide_string']
        identifier.sub!(@config['elide_string'], '')
      end
      identifier
    end
  end
end

if __FILE__ == $0
  file = File.join File.dirname(File.dirname(__FILE__)),
                   'config',
                   'minter.yml'
  m = MintyRb::Minter.new file
  puts m.mint
end
