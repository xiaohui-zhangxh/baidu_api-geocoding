
require 'baidu_api/geocoding/version'
require 'baidu_api/geocoding/configuration'
require 'baidu_api/geocoding/v2/geocoder'

module BaiduApi
  module Geocoding
    extend self
    # options:
    #  :ak
    #  :sk
    #  :output    default: json
    #  :version   default: v2
    def setup(options = {})
      @@config = BaiduApi::Geocoding::Configuration.new(options)
      yield @@config if block_given?
    end

    def config
      @@config || fail(ArgumentError, 'Please setup API with BaiduApi::Geocoding.setup(options) before starting!')
    end

    def geocode(address, options = {})
      options = fetch_options(options)
      version = options.delete(:version).upcase
      geocoder = Object.const_get("BaiduApi::Geocoding::#{version}::Geocoder") rescue fail(ArgumentError, "API version #{version} doesn't exist!")
      geocoder.geocode(address, options)
    end

    def fetch_options(options)
      %w(ak sk version).inject({}) do |ret, item|
        ret[item.intern] = fetch_option(options, item)
        ret
      end
    end

    def fetch_option(options, key)
      options.fetch(key.intern) { options.fetch(key.to_s, config[key]) }
    end

  end
end
