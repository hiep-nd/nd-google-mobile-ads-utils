//
//  NDMVVM_Views_NDAdMobSmallTemplateNativeAdTableViewCell.mm
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 21/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDGoogleMobileAdsUtils/NDMVVM_Views_NDAdMobSmallTemplateNativeAdTableViewCell.h>

#import <NDGoogleMobileAdsUtils/GADTSmallTemplateView.h>
#import <NDGoogleMobileAdsUtils/NDAdMobNativeAdView.h>

@implementation NDAdMobSmallTemplateNativeAdTableViewCell

- (__kindof NDAdMobNativeAdView*)createNativeAdView {
  auto view = [[NDAdMobNativeAdView alloc] init];
  view.unifiedNativeAdView = [[GADTSmallTemplateView alloc] init];
  return view;
}

@end
