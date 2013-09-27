require 'net/http'
require 'uri'
require 'yaml'

module MintyRb
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
