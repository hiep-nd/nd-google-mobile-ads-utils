//
//  NDMVVM_ViewModels_NDAdMobAdUnitItemViewModel.h
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/NDMVVM.h>

#import <NDGoogleMobileAdsUtils/NDMVVM_Abstracts_NDAdMobAdUnitItemViewModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDAdMobAdUnitItemViewModel
    : NDItemViewModel <NDAdMobAdUnitItemViewModel>

- (instancetype)initWithIdentifier:(NSString*)identifier
                          adUnitID:(NSString* _Nullable)adUnitID
                            adSize:(GADAdSize)adSize;
+ (instancetype)bannerWithIdentifier:(NSString*)identifier
                            adUnitID:(NSString* _Nullable)adUnitID
    NS_SWIFT_NAME(banner(identifier:adUnitID:));
+ (instancetype)rectangleWithIdentifier:(NSString*)identifier
                               adUnitID:(NSString* _Nullable)adUnitID
    NS_SWIFT_NAME(rectangle(identifier:adUnitID:));

@end

NS_ASSUME_NONNULL_END
