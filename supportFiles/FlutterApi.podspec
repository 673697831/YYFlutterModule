Pod::Spec.new do |s|

  s.name         = "FlutterApi"
  s.version      = "0.1.0"
  s.summary      = "A short description of flutterApi."
  s.homepage     = "https://github.com/673697831/YYFlutterModule"
  s.platform     = :ios, "9.0"
  s.license         = { type: 'MIT', file: 'LICENSE' }
  s.author       = { "ouzhirui" => "ouzhirui@yy.com" }

  s.source       = { :git => 'https://github.com/673697831/YYFlutterModule.git', :tag => s.version.to_s } 

  s.source_files  = "outProduct/ios/flutter/FlutterPluginRegistrant/**/*.{h,m,mm}" ,"outProduct/ios/plugins/**/*.{h,m,mm}" 

  s.vendored_frameworks = 'outProduct/ios/flutter/*.framework'

#  s.resources = 'flutter/flutter_assets'
#  s.vendored_libraries = 'Plugin/**/*.{a}'
#  s.prepare_command = "bash ./BDFlutterDownload.sh"
# s.dependency 'url_launcher'

  <dependency>

end
