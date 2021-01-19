//
//  NDAdMobBannerView.h
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2021.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDManualObjects/NDManualObjects.h>

#import <NDGoogleMobileAdsUtils/NDAdMobAdView.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDAdMobBannerView : NDManualView <NDAdMobAdView>
@property(nonatomic, readonly, strong) GADBannerView* bannerView;
@end

NS_ASSUME_NONNULL_END
