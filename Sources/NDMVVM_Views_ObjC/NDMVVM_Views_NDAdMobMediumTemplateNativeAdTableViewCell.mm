//
//  NDMVVM_Views_NDAdMobMediumTemplateNativeAdTableViewCell.mm
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 21/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDGoogleMobileAdsUtils/NDMVVM_Views_NDAdMobMediumTemplateNativeAdTableViewCell.h>

#import <NDGoogleMobileAdsUtils/GADTMediumTemplateView.h>
#import <NDGoogleMobileAdsUtils/NDAdMobNativeAdView.h>

@implementation NDAdMobMediumTemplateNativeAdTableViewCell

- (__kindof NDAdMobNativeAdView*)createNativeAdView {
  auto view = [[NDAdMobNativeAdView alloc] init];
  view.nativeAdView = [[GADTMediumTemplateView alloc] init];
  return view;
}

@end
