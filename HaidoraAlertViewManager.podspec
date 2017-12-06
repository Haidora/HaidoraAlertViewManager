Pod::Spec.new do |s|
  s.name             = "HaidoraAlertViewManager"
  s.version          = "0.1.1"
  s.summary          = "A wrapper for alertView."
  s.description      = <<-DESC
                        A wrapper for alertView,only one api for alertView.
                       DESC
  s.homepage         = "https://github.com/Haidora/HaidoraAlertViewManager"
  s.license          = 'MIT'
  s.author           = { "liaowei" => "598951856@qq.com" }
  s.source           = { :git => "https://github.com/Haidora/HaidoraAlertViewManager.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.subspec 'Core' do |core|
      core.source_files = 'Pod/Classes/*'
  end
  s.subspec 'UIAlertView' do |alertView|
      alertView.source_files = 'Pod/Classes/UIAlertView/*'
      alertView.dependency 'HaidoraAlertViewManager/Core'
  end
  
end
