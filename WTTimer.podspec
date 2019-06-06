Pod::Spec.new do |s|
  
  s.name         = "WTTimer"
  s.version      = "0.0.2"
  s.summary      = "A Category of NSTimer can avoid  memory leak that caused by circular reference."
  s.description  = "This library provides a category for NSTimer. You don't need to invoke the invalidate method in timer manually, which can avoid  memory leak that caused by circular reference."
  s.homepage     = "https://github.com/windtersharp/NSTimer"
  s.author       = { "windtersharp" => "windter@126.com" }
  s.license      = {:type => "MIT", :file => 'LICENSE.txt' }
  
  s.requires_arc = true
  s.frameworks   = "Foundation"
  s.platform     = :ios
  s.platform     = :ios, "7.0"
  
  s.source                = { :git => "https://github.com/windtersharp/NSTimer.git", :tag => "#{s.version}" }
  s.source_files          ="Timer/NSTimer+WTUtils.{h,m}"
  s.public_header_files   ="Timer/NSTimer+WTUtils.h"

end
