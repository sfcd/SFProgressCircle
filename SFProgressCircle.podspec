Pod::Spec.new do |s|
  s.name         = "SFProgressCircle"
  s.version      = "1.0.0"
  s.summary      = "Progress circle with gradient for iOS"
  s.description  = <<-DESC
                   Provides wide range of customization options.
                   Supports XCode 6 live rendering feature for on-the-fly customization.
                   Has ability to animate ProgressBar's progress chage.
                   DESC
  s.homepage     = "http://sfcd.com"
  s.screenshots  = "https://raw.githubusercontent.com/Eclair/CircleProgressBar/master/Screenshots/ios-screen01.png", "https://raw.githubusercontent.com/Eclair/CircleProgressBar/master/Screenshots/ios-screen02.png"
  s.license      = 'MIT'
  s.author       = { "SFÇD" => "developers@softfacade.com" }
  s.source       = { :git => "https://github.com/sfcd/SFProgressCircle.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Source/*'
  s.framework    = 'UIKit', 'QuartzCore'
end
