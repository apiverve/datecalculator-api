Pod::Spec.new do |s|
  s.name             = 'APIVerveDateCalculator'
  s.version          = '1.2.3'
  s.summary          = 'Date Calculator computes the difference between two calendar dates in minutes, hours, days, weeks, months, and years.'
  s.description      = <<-'DESC'
Date Calculator computes the difference between two calendar dates in minutes, hours, days, weeks, months, and years. Supply start and end dates in YYYY-MM-DD format to receive exact interval breakdowns.

This iOS/macOS SDK provides a convenient way to access the Date Calculator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/datecalculator?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/datecalculator-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveDateCalculator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
