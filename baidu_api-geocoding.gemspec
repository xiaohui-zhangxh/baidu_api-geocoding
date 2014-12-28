# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baidu_api/geocoding/version'

Gem::Specification.new do |spec|
  spec.name          = "baidu_api-geocoding"
  spec.version       = BaiduApi::Geocoding::VERSION
  spec.authors       = ["xiaohui"]
  spec.email         = ["xiaohui@zhangxh.net"]
  spec.summary       = %q{A ruby version [Baidu API Geocoder](http://developer.baidu.com/map/index.php?title=webapi/guide/webservice-geocoding) client.
}
  spec.homepage      = "http://github.com/xiaohui-zhangxh/baidu_api-geocoding"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
