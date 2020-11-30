#
# Be sure to run `pod lib lint DeviceInfo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TTDeviceInfo'
  s.version          = '0.1.0'
  s.summary          = 'A Map for other framework of get device info.'
  s.description      = <<-DESC
collection of other framework to get device info because there repo exist doesn't cover all my need, so I merge and map it for my use
                       DESC

  s.homepage         = 'https://github.com/takeTrace/DeviceInfo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'takeTrace' => 'takeTrace00@gmail.com' }
  s.source           = { :git => 'https://github.com/takeTrace/DeviceInfo.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'DeviceInfo/Classes/**/*'
  s.dependency 'DeviceKit'
  s.dependency 'TakeTPhoneInfo'
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.10.0'
end
