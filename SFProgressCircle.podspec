Pod::Spec.new do |s|
  s.name         = "SFProgressCircle"
  s.version      = "1.0.4"
  s.summary      = "A circular gradient progress view implementation for iOS (supports partial circle)"
  s.description  = <<-DESC
                   A circular gradient progress view implementation for iOS (supports partial circle)
                   * Perfect circular gradient.
                   * Possibility to set both startColor and endColor.
                   * Possibility to set both startAngle and endAngle.
                   * Possibility to set lineWidth.
                   * Possibility to set progress with or without animation.
                   DESC
  s.homepage     = "https://github.com/sfcd/SFProgressCircle.git"
  s.screenshots  = "https://raw.githubusercontent.com/sfcd/SFProgressCircle/master/Example/Resources/scr.png"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "SFÇD" => "developers@softfacade.com" }
  s.source       = { :git => "https://github.com/sfcd/SFProgressCircle.git", :tag => s.version }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Source/*'
  s.framework    = 'UIKit', 'QuartzCore'
end
