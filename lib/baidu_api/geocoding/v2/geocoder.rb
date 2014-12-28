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

        def geocode(data)
          queries = fetch_query_params(data) + [[:output, 'json']]
          url = "#{API_HOST}#{GEOCODER_PATH}?#{to_query(queries)}"
          url << "&sn=#{calculate_ak_sn(queries, data[:sk])}" if data[:sk]
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
            v && "#{CGI.escape(k.to_s)}=#{CGI.escape(v)}"
          end.compact.join('&')
          debug('query_str', query_str)
          query_str
        end

        def fetch_query_params(data)
          %w(output ak address city coordtype location pois).map do |k|
            [k.intern, data[k.intern]]
          end.compact
        end

        def debug(subject, msg)
          puts "#{subject}: #{msg}" if BaiduApi::Geocoding.config.debug
        end

      end
    end
  end
end
