# Uncomment the next line to define a global platform for your project
 platform :ios, '14.0'

target 'SimpleDemoCleanArchitecture' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  # Clean Architecture
  pod 'Reusable', '~> 4.1.2'
  pod 'Then', '~> 2.7.0'
  pod 'SnapKit', '~> 5.0.1'
  pod 'Moya/RxSwift', '~> 15.0.0'
  pod 'RxAppState', '~> 1.7.1'
  pod 'RxDataSources', '~> 5.0.0'
  pod 'RxSwift', '~> 6.5.0'
  pod 'NSObject+Rx', '~> 5.2.2'
  
  # Others
  pod 'MBProgressHUD', '~> 1.2.0'
  pod 'SDWebImage', '~> 5.12.3'
  pod 'IQKeyboardManagerSwift', '~> 6.5.9'
end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
            end
        end
    end
end
