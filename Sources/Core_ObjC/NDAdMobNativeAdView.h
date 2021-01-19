//
//  NDAdMobNativeAdView.h
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/NDManualObjects.h>

#import <NDGoogleMobileAdsUtils/NDAdMobAdView.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDAdMobNativeAdView : NDManualView <NDAdMobAdView>
@property(nonatomic, strong) GADUnifiedNativeAdView* unifiedNativeAdView;
@end

NS_ASSUME_NONNULL_END
