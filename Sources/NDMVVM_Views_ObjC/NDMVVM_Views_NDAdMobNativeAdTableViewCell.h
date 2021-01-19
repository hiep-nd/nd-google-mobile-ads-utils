//
//  NDMVVM_Views_NDAdMobNativeAdTableViewCell.h
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 14/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/NDMVVM.h>

#import <NDGoogleMobileAdsUtils/NDAdMobAdViewContainer.h>

NS_ASSUME_NONNULL_BEGIN

@class NDAdMobNativeAdView;

@interface NDAdMobNativeAdTableViewCell
    : NDTableViewCell <NDAdMobAdViewContainer>
@property(nonatomic, strong, readonly) NDAdMobNativeAdView* nativeAdView;
@property(nonatomic, strong, readonly) NSLayoutConstraint* heightConstraint;

- (__kindof NDAdMobNativeAdView*)createNativeAdView;
@end

@interface NDAdMobSmallTemplateNativeAdTableViewCell
    : NDAdMobNativeAdTableViewCell
@end

NS_ASSUME_NONNULL_END
