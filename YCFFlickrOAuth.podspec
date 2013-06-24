Pod::Spec.new do |s|
    s.name = 'YCFFlickrOAuth'
    s.version = '0.0.1'
    s.homepage = 'https://github.com/teaualune/YCFFlickrOAuth'
    s.summary = 'A simple Flickr OAuth manager and flickr request sets'
    s.author = { 'Tailun Tseng' => 'teaualune@gmail.com' }
    s.platform = :ios
    s.ios.deployment_target = '5.0'
    s.source = { :git => 'git@github.com:teaualune/YCFFlickrOAuth.git', :tag => 'v0.0.1' }
    s.requires_arc = true
    s.dependency 'AFNetworking', '~> 1.3.1'
    s.dependency 'AFOAuth1Client', '~> 0.2.0'
    s.source_files = '*.{h,m}'
end
