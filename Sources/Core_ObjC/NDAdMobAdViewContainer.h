//
//  NDAdMobAdViewContainer.h
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NDAdMobAdView;

NS_SWIFT_NAME(NDAdMobAdViewContainerProtocol)
@protocol NDAdMobAdViewContainer <NSObject>

@property(nonatomic, strong, readonly) __kindof id<NDAdMobAdView> adView;

@end

NS_ASSUME_NONNULL_END
