module BaiduApi::Geocoding::Exceptions
  class Failed < StandardError
    attr_reader :raw
    def initialize(raw)
      @raw = raw
      super(raw['msg'])
    end
  end
end
