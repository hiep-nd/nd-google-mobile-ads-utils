//
//  NDAdMobAdView.h
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <GoogleMobileAds/GoogleMobileAds.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDAdMobAdViewProtocol)
@protocol NDAdMobAdView <NSObject>
@property(nonatomic, copy) NSString* _Nullable adUnitID;
@property(nonatomic, assign) GADAdSize adSize;
@property(nonatomic, weak) UIViewController* _Nullable rootViewController;
@property(nonatomic, readonly, strong)
    UIActivityIndicatorView* activityIndicatorView;
#if TARGET_IPHONE_SIMULATOR
@property(nonatomic, readonly, strong) UILabel* debugLabel;
#endif
@end

NS_ASSUME_NONNULL_END
