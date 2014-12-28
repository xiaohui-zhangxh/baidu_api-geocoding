
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

    def geocode(data = {})
      data = fetch_accepted_data(data)
      version = data.delete(:version).upcase
      geocoder = Object.const_get("BaiduApi::Geocoding::#{version}::Geocoder") rescue fail(ArgumentError, "API version #{version} doesn't exist!")
      geocoder.geocode(data)
    end

    def fetch_accepted_data(data)
      %w(ak sk version address city coordtype location pois).inject({}) do |ret, item|
        ret[item.intern] = fetch_data(data, item)
        ret
      end
    end

    def fetch_data(data, key)
      data.fetch(key.intern) { data.fetch(key.to_s, config[key]) }
    end

  end
end
