//
//  NDMVVM_Views_NDAdMobBannerTableViewCell.h
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/NDMVVM.h>

#import <NDGoogleMobileAdsUtils/NDAdMobAdViewContainer.h>

NS_ASSUME_NONNULL_BEGIN

@class NDAdMobBannerView;

@interface NDAdMobBannerTableViewCell : NDTableViewCell <NDAdMobAdViewContainer>

@property(nonatomic, strong, readonly) NDAdMobBannerView* bannerView;
@property(nonatomic, strong, readonly) NSLayoutConstraint* heightConstraint;

@end

NS_ASSUME_NONNULL_END
