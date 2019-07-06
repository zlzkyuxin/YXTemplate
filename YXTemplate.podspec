#
# Be sure to run `pod lib lint YXTemplate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YXTemplate'
  s.version          = '0.1.0'
  s.summary          = '自定义类库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
#  TODO: Add long description of the pod here.
自定义类库 ------------
                       DESC

  s.homepage         = 'https://github.com/zlzkyuxin/YXTemplate.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zlzkyuxin' => '1134548344@qq.com' }
  s.source           = { :git => 'https://github.com/zlzkyuxin/YXTemplate.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  #系统类库
  s.frameworks = 'UIKit'
  #第三方类库
  s.dependency 'MBProgressHUD', '~> 1.1.0'
  
  #对外发布头文件
  s.public_header_files = 'Pod/Classes/**/*.h'
  #对外发布文件
  s.source_files = 'YXTemplate/Classes/**/*'
  
  #对外发布资源文件
  # s.resource_bundles = {
  #   'YXTemplate' => ['YXTemplate/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
