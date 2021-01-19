//
//  NDGoogleMobileAdsUtils.h
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 10/16/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for NDGoogleMobileAdsUtils.
FOUNDATION_EXPORT double NDGoogleMobileAdsUtilsVersionNumber;

//! Project version string for NDGoogleMobileAdsUtils.
FOUNDATION_EXPORT const unsigned char NDGoogleMobileAdsUtilsVersionString[];

#if !defined(__has_include)
#error \
    "NDGoogleMobileAdsUtils.h won't import anything if your compiler doesn't support __has_include. Please import the headers individually."
#else

#import <NDGoogleMobileAdsUtils/NDAdMobAdView.h>
#import <NDGoogleMobileAdsUtils/NDAdMobAdViewContainer.h>
#import <NDGoogleMobileAdsUtils/NDAdMobBannerView.h>
#import <NDGoogleMobileAdsUtils/NDAdMobNativeAdView.h>
#import <NDGoogleMobileAdsUtils/NDManualTableViewController+NDGoogleMobileAdsUtils.h>
#import <NDGoogleMobileAdsUtils/UILabel+NDGoogleMobileAdsUtils.h>

#if __has_include(<NDGoogleMobileAdsUtils/googleads-mobile-ios-native-templates.h>)
#import <NDGoogleMobileAdsUtils/googleads-mobile-ios-native-templates.h>
#endif

#if __has_include(<NDGoogleMobileAdsUtils/NDMVVM_Abstracts_ObjC.h>)
#import <NDGoogleMobileAdsUtils/NDMVVM_Abstracts_ObjC.h>
#endif

#if __has_include(<NDGoogleMobileAdsUtils/Firebase.h>)
#import <NDGoogleMobileAdsUtils/Firebase.h>
#endif

#endif
