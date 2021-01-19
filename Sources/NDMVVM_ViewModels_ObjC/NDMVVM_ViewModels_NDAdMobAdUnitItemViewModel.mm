//
//  NDAdMobAdUnitItemViewModel.m
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDGoogleMobileAdsUtils/NDMVVM_ViewModels_NDAdMobAdUnitItemViewModel.h>

@implementation NDAdMobAdUnitItemViewModel

@synthesize adUnitID = _adUnitID;
@synthesize adSize = _adSize;

- (instancetype)initWithIdentifier:(NSString*)identifier
                          adUnitID:(NSString* _Nullable)adUnitID
                            adSize:(GADAdSize)adSize {
  self = [super initWithIdentifier:identifier];
  if (self) {
    self.adUnitID = adUnitID;
    self.adSize = adSize;
  }
  return self;
}

+ (instancetype)bannerWithIdentifier:(NSString*)identifier
                            adUnitID:(NSString* _Nullable)adUnitID {
  return [[self alloc] initWithIdentifier:identifier
                                 adUnitID:adUnitID
                                   adSize:kGADAdSizeBanner];
}

+ (instancetype)rectangleWithIdentifier:(NSString*)identifier
                               adUnitID:(NSString* _Nullable)adUnitID {
  return [[self alloc] initWithIdentifier:identifier
                                 adUnitID:adUnitID
                                   adSize:kGADAdSizeMediumRectangle];
}

@end
