source 'https://github.com/CocoaPods/Specs.git'
platform :ios, ’10.0’
use_frameworks!

target 'SoundCloudViper' do
   # pod 'Alamofire', '~> 4.0'
    pod 'Unbox'
    pod 'RxAlamofire’, ‘3.0.0-rc.1’
    pod 'SwiftyJSON'
    pod 'SDWebImage/WebP'
    pod 'RxSwift',    '3.0.0-rc.1'
    pod 'RxCocoa',    '3.0.0-rc.1'
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
		end
	end
end
