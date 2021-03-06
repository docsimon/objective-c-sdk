Pod::Spec.new do |s|
  s.name                    = "OptimizelySDKCore"
  s.version                 = "1.0.1"
  s.summary                 = "Optimizely server-side testing core framework."
  s.homepage                = "http://developers.optimizely.com/server/reference/index.html?language=objectivec"
  s.license                 = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.author                  = { "Optimizely" => "support@optimizely.com" }
  s.platform                = :ios, '10.1', :tvos, '10.1'
  s.ios.deployment_target   = "8.0"
  s.tvos.deployment_target  = "9.0"
  s.source                  = {
    :git => "https://github.com/optimizely/objective-c-sdk.git",
    :tag => "core-"+s.version.to_s
  }
  s.source_files            = "OptimizelySDKCore/OptimizelySDKCore/*.{h,m}",  "OptimizelySDKCore/Frameworks/**/*.{c,h,m}"
  s.public_header_files     = "OptimizelySDKCore/OptimizelySDKCore/*.h"
  s.exclude_files           = "OPTLYMacros.h", "OPTLYLog.h", "OPTLYLog.m"
  s.framework               = "Foundation"
  s.requires_arc            = true
  s.xcconfig                = { 'GCC_PREPROCESSOR_DEFINITIONS' => "OPTIMIZELY_SDK_CORE_VERSION=@\\\"#{s.version}\\\"" }
  s.subspec "JSONModel" do |ss|
      ss.dependency 'JSONModel', '= 1.3.0'
      ss.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/JSONModel" }
  end

end
