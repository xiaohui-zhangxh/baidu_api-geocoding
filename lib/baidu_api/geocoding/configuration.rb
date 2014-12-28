module BaiduApi
  module Geocoding
    class Configuration
      attr_accessor :ak, :sk, :version, :debug

      def initialize(options)
        @ak       = options.fetch(:ak){ options.fetch('ak') { fail ArgumentError, 'Missing argument :ak for configuration!' } }
        @sk       = options.fetch(:sk){ options.fetch('sk', nil) }
        @version  = options.fetch(:version){ options.fetch('version', 'v2') }
        @debug    = options.fetch(:debug){ options.fetch('debug', false) }
      end

      def [](key)
        respond_to?(key) ? send(key) : nil
      end

    end
  end
end
