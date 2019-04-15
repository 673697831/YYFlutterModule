Pod::Spec.new do |s|

  s.name         = "FlutterApi"
  s.version      = "0.0.4"
  s.summary      = "A short description of flutterApi."
  s.homepage     = "http://flutterApi"
  s.platform     = :ios, "9.0"
  s.license         = { type: 'MIT', file: 'LICENSE' }
  s.author       = { "luph" => "luph@yy.com" }

  s.source       = { :path => "~/Documents/luph/testPro/flutter_module/outProduct/ios" } 

  s.source_files  = "flutter", "flutter/FlutterPluginRegistrant/**/*.{h,m,mm}" ,"plugins/**/*.{h,m,mm}" 

  s.vendored_frameworks = 'flutter/*.framework'

#  s.resources = 'flutter/flutter_assets'
#  s.vendored_libraries = 'Plugin/**/*.{a}'
#  s.prepare_command = "bash ./BDFlutterDownload.sh"
# s.dependency 'url_launcher'

  <dependency>

end
