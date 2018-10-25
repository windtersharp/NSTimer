Pod::Spec.new do |s|
  
  s.name         = "WTTimer"
  s.version      = "0.0.1"
  s.summary      = "A Category of NSTimer can avoid  memory leak that caused by circular reference."
  s.description  = "This library provides a category for NSTimer. It can avoid  memory leak that caused by circular reference."
  s.homepage     = "https://github.com/windtersharp/NSTimer"
  s.author       = { "windtersharp" => "windter@126.com" }
  s.license      = {:type => "MIT", :file => 'LICENSE.txt' }
  
  s.requires_arc = true
  s.frameworks   = "Foundation"
  s.platform     = :ios
  s.platform     = :ios, "7.0"
  
  s.source       = { :git => "https://github.com/windtersharp/NSTimer.git", :tag => "#{s.version}" }
  s.source_files  = "Timer", "Timer/*.{h,m}"
  s.public_header_files = "Timer/*.h"

end
