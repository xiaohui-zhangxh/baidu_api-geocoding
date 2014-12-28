# BaiduApi::Geocoding

A ruby version of [Baidu API Geocoder](http://developer.baidu.com/map/index.php?title=webapi/guide/webservice-geocoding) client.

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

```ruby
BaiduApi::Geocoding.setup ak: 'xxxx', sk: 'xxxx'
```

or

```ruby
BaiduApi::Geocoding.setup do |config|
  config.ak = 'xxxx'
  config.sk = 'xxxx'
end
```

To geocode an address:

```ruby

BaiduApi::Geocoding.geocode(address: '百度大厦')
=> {"status"=>0, "result"=>{"location"=>{"lng"=>116.30814954222, "lat"=>40.056885091681}, "precise"=>1, "confidence"=>80, "level"=>"商务大厦"}}

BaiduApi::Geocoding.geocode(location: '40.056885091681,116.30814954222')
=> {"status"=>0,
 "result"=>
  {"location"=>{"lng"=>116.30814954222, "lat"=>40.056885160713},
   "formatted_address"=>"北京市海淀区上地十街10",
   "business"=>"西二旗,龙泽,回龙观",
   "addressComponent"=>{"city"=>"北京市", "direction"=>"附近", "distance"=>"1", "district"=>"海淀区", "province"=>"北京市", "street"=>"上地十街", "street_number"=>"10"},
   "poiRegions"=>[{"direction_desc"=>"内", "name"=>"百度大厦"}],
   "cityCode"=>131}}
```

More options for parameter of BaiduApi::Geocoding.geocode, please see http://developer.baidu.com/map/index.php?title=webapi/guide/webservice-geocoding


## Contributing

1. Fork it ( https://github.com/[my-github-username]/baidu_api-geocoding/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
