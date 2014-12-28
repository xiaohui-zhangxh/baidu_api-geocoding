require 'cgi'
require 'digest/md5'
require 'erb'
require 'open-uri'
require 'json'

module BaiduApi
  module Geocoding
    module V2
      module Geocoder
        extend self

        API_HOST = 'http://api.map.baidu.com'
        GEOCODER_PATH = '/geocoder/v2/'

        def geocode(address, options)
          queries = [
            [:address, address],
            [:output, 'json'],
            [:ak, options[:ak]]
          ]
          url = "#{API_HOST}#{GEOCODER_PATH}?#{to_query(queries)}"
          url << "&sn=#{calculate_ak_sn(queries, options[:sk])}" if options[:sk]
          debug('url', url)
          open(url) do |http|
            ret = JSON.parse(http.read)
          end
        end

        def calculate_ak_sn(queries, sk)
          query_str = ERB::Util.url_encode("#{GEOCODER_PATH}?#{to_query(queries)}#{sk}")
          debug('unencrypted query', query_str)
          sn = Digest::MD5.hexdigest(query_str)
          debug('sn', sn)
          sn
        end

        def to_query(arr)
          query_str = arr.map do |k, v|
            "#{CGI.escape(k.to_s)}=#{CGI.escape(v)}"
          end.join('&')
          debug('query_str', query_str)
          query_str
        end

        def debug(subject, msg)
          puts "#{subject}: #{msg}" if BaiduApi::Geocoding.config.debug
        end

      end
    end
  end
end
