#
# Be sure to run `pod lib lint TLCrash.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TLCrash'
  s.version          = '1.0.0'
  s.summary          = 'Crash 收集，保存在NSDocumentDirectory，也可以上传服务器'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "DESCBUG收集"

  s.homepage         = 'https://github.com/TLCrash/TLCrash'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'TLCrash' => '857258218@qq.com' }
  s.source           = { :git => 'https://github.com/tang335976123/TLCrash.git', :tag => s.version.to_s }
#   s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
#  s.social_media_url = 'https://www.jianshu.com/u/9d3ddb989614'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TLCrash/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TLCrash' => ['TLCrash/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
