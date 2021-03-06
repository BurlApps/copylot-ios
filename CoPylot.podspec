#
# Be sure to run `pod lib lint CoPylot.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CoPylot"
  s.version          = "0.2"
  s.summary          = "iOS client for CoPylot."
  s.homepage         = "https://docs.copylot.io/docs/ios"
  s.license          = 'MIT'
  s.author           = { "Brian Vallelunga" => "vallelungabrian@gmail.com" }
  s.source           = { :git => "https://github.com/copylot/copylot-ios.git", :tag => "v#{s.version}" }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'

  s.frameworks = 'UIKit'
  s.dependency 'AFNetworking', '~> 2.3'
end
