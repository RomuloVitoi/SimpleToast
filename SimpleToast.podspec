Pod::Spec.new do |s|
  s.name = 'SimpleToast'
  s.version = '0.1.1'
  s.license = 'MIT'
  s.summary = 'Simple toasts with Android-like API and keyboard aware positioning.'
  s.homepage = 'https://github.com/lohmander/SimpleToast'
  s.authors = { 'Hannes Lohmander' => 'hannes@lohmander.me' }
  s.source = { :git => 'https://github.com/lohmander/SimpleToast.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Toast/Toast/*.swift'

  s.requires_arc = true
end
