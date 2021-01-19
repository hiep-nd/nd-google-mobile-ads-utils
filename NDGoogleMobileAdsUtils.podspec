Pod::Spec.new do |s|
  s.name         = "NDGoogleMobileAdsUtils"
  s.version      = "0.1"
  s.summary      = "A utility framework for GoogleMobileAds."
  s.description  = <<-DESC
  NDGoogleMobileAdsUtils is a small framework that support GoogleMobileAds.
                   DESC
  s.homepage     = "https://github.com/hiep-nd/nd-google-mobile-ads-utils.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nguyen Duc Hiep" => "hiep.nd@gmail.com" }
  s.ios.deployment_target = '9.0'
#  s.tvos.deployment_target = '9.0'
  s.swift_versions = ['4.0', '5.1', '5.2']
  s.requires_arc   = true
  #s.source        = { :http => 'file:' + URI.escape(__dir__) + '/' }
  s.source       = { :git => "https://github.com/hiep-nd/nd-google-mobile-ads-utils.git", :tag => "Pod-#{s.version}" }
  s.static_framework = true

  s.subspec 'Core_ObjC' do |ss|
    ss.source_files = "Sources/Core_ObjC/*.{h,m,mm,swift}"

    ss.framework = 'Foundation', 'UIKit'

    ss.dependency 'Google-Mobile-Ads-SDK', '~> 7.0'
    ss.dependency 'NDManualObjects/ObjC', '~> 0.0.8.3'
    ss.dependency 'NDAutolayoutUtils/ObjC', '~> 0.0.7.0'
    ss.dependency 'NDUtils/UIKit_ObjC', '~> 0.0.5.0'
  end

  s.subspec 'Core_Swift' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/Core_ObjC'
  end

  s.subspec 'Core' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/Core_Swift'
  end

  s.subspec 'googleads-mobile-ios-native-templates' do |ss|
    ss.source_files = "ThirdParties/googleads-mobile-ios-native-templates/nativetemplates/*.{h,m,mm,swift}","Sources/googleads-mobile-ios-native-templates/*.{h,m,mm,swift}"
    ss.resource_bundle = { "googleads-mobile-ios-native-templates" => [ "ThirdParties/googleads-mobile-ios-native-templates/nativetemplates/*.xib" ] }

    ss.framework = 'Foundation', 'UIKit'

    ss.dependency 'Google-Mobile-Ads-SDK', '~> 7.0'
    ss.dependency 'NDUtils/Foundation_ObjC', '~> 0.0.5.0'
  end

  s.subspec 'NDMVVM_Abstracts_ObjC' do |ss|
    ss.source_files = "Sources/NDMVVM_Abstracts_ObjC/*.{h,m,mm,swift}"

    ss.framework = 'Foundation'

    ss.dependency 'Google-Mobile-Ads-SDK', '~> 7.0'
    ss.dependency 'NDMVVM/Abstracts_ObjC', '~> 0.0.4.2'
  end

  s.subspec 'NDMVVM_Abstracts_Swift' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Abstracts_ObjC'
  end

  s.subspec 'NDMVVM_Abstracts' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Abstracts_Swift'
  end

  s.subspec 'NDMVVM_ViewModels_ObjC' do |ss|
    ss.source_files = "Sources/NDMVVM_ViewModels_ObjC/*.{h,m,mm,swift}"

    ss.framework = 'Foundation'

    ss.dependency 'Google-Mobile-Ads-SDK', '~> 7.0'
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Abstracts_ObjC'
    ss.dependency 'NDMVVM/ViewModels_ObjC', '~> 0.0.4.2'
  end

  s.subspec 'NDMVVM_ViewModels_Swift' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_ViewModels_ObjC'
  end

  s.subspec 'NDMVVM_ViewModels' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_ViewModels_Swift'
  end

  s.subspec 'NDMVVM_Views_ObjC' do |ss|
    ss.source_files = "Sources/NDMVVM_Views_ObjC/*.{h,m,mm,swift}"

    ss.framework = 'Foundation', 'UIKit'

    ss.dependency 'Google-Mobile-Ads-SDK', '~> 7.0'
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Abstracts_ObjC'
    ss.dependency 'NDGoogleMobileAdsUtils/Core_ObjC'
    ss.dependency 'NDGoogleMobileAdsUtils/googleads-mobile-ios-native-templates'
    ss.dependency 'NDMVVM/Views_ObjC', '~> 0.0.4.2'
  end

  s.subspec 'NDMVVM_Views_Swift' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Views_ObjC'
  end

  s.subspec 'NDMVVM_Views' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Views_Swift'
  end

  s.subspec 'NDMVVM_ObjC' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Abstracts_ObjC'
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_ViewModels_ObjC'
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Views_ObjC'
  end

  s.subspec 'NDMVVM_Swift' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Abstracts_Swift'
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_ViewModels_Swift'
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Views_Swift'
  end

  s.subspec 'NDMVVM' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Swift'
  end

  s.subspec 'ObjC' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/Core_ObjC'
    ss.dependency 'NDGoogleMobileAdsUtils/googleads-mobile-ios-native-templates'
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_ObjC'
  end

  s.subspec 'Swift' do |ss|
    ss.dependency 'NDGoogleMobileAdsUtils/Core_Swift'
    ss.dependency 'NDGoogleMobileAdsUtils/googleads-mobile-ios-native-templates'
    ss.dependency 'NDGoogleMobileAdsUtils/NDMVVM_Swift'
  end

  s.default_subspec = 'Swift'
end
