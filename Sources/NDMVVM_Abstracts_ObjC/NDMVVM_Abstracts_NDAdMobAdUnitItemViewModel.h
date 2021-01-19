//
//  NDMVVM_Abstracts_NDAdMobAdUnitItemViewModel.h
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDMVVM/NDMVVM.h>

#import <GoogleMobileAds/GoogleMobileAds.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NDAdMobAdUnitItemViewModelProtocol)
@protocol NDAdMobAdUnitItemViewModel <NDItemViewModel>

@property(nonatomic, copy) NSString* _Nullable adUnitID;
@property(nonatomic, assign) GADAdSize adSize;

@end

NS_ASSUME_NONNULL_END
