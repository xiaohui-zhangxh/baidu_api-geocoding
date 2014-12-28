# BaiduApi::Geocoding

A ruby version [Baidu API Geocoder](http://developer.baidu.com/map/index.php?title=webapi/guide/webservice-geocoding) client.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'baidu_api-geocoding'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baidu_api-geocoding

## Usage

```ruby
require 'baidu_api/geocoding'
```

  BaiduApi::Geocoding.setup ak: 'xxxx', sk: 'xxxx'

or

  BaiduApi::Geocoding.setup do |config|
    config.ak = 'xxxx'
    config.sk = 'xxxx'
  end

then

  BaiduApi::Geocoding.geocode('百度大厦')
  => {"status"=>0, "result"=>{"location"=>{"lng"=>116.30814954222, "lat"=>40.056885091681}, "precise"=>1, "confidence"=>80, "level"=>"商务大厦"}

## Contributing

1. Fork it ( https://github.com/[my-github-username]/baidu_api-geocoding/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
