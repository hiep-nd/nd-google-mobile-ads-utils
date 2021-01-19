//
//  NDAdMobBannerView.mm
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDGoogleMobileAdsUtils/NDAdMobBannerView.h>

#import <NDGoogleMobileAdsUtils/UILabel+NDGoogleMobileAdsUtils.h>

#import <NDAutolayoutUtils/NDAutolayoutUtils.h>
#import <NDUtils/NDUtils.h>

using namespace nd::objc;

@interface NDAdMobBannerView () <GADBannerViewDelegate>
@property(nonatomic, strong) UIActivityIndicatorView* activityIndicatorView;
@property(nonatomic, strong) GADBannerView* bannerView;
#if TARGET_IPHONE_SIMULATOR
@property(nonatomic, strong) UILabel* debugLabel;
#endif

@end

@implementation NDAdMobBannerView

// MARK:- NDManualView
- (void)manualInit {
  [super manualInit];
  self.activityIndicatorView = [[UIActivityIndicatorView alloc]
      initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  self.bannerView = [[GADBannerView alloc] init];
  self.bannerView.delegate = self;

#if TARGET_IPHONE_SIMULATOR
  self.debugLabel = [UILabel nd_adMobDebuggerLabel];
#endif
  [self nd_wrapItem:self.bannerView
      visualConstraints:@[
        @"V:[safeArea_center][item_center]",
        @"V:[safeArea_top]->=0-[item]->=0-[safeArea_bottom]",
        @"H:[safeArea_center][item_center]",
        @"H:[safeArea_leading]->=0-[item]->=0-[safeArea_trailing]",
      ]];
#if TARGET_IPHONE_SIMULATOR
  [self nd_fillWithContentView:self.debugLabel];
#endif
  [self nd_wrapItem:self.activityIndicatorView
      visualConstraints:@[
        @"V:[safeArea_center][item_center]",
        @"H:[safeArea_center][item_center]",
      ]];
}

// MARK:- NDAdMobAdView
- (NSString*)adUnitID {
  return self.bannerView.adUnitID;
}

- (void)setAdUnitID:(NSString*)adUnitID {
  if (SameOrEquals(self.adUnitID, adUnitID)) {
    return;
  }

  self.bannerView.adUnitID = adUnitID;
#if TARGET_IPHONE_SIMULATOR
  self.debugLabel.text =
      [NSString stringWithFormat:@"AdUnitID: '%@'.", adUnitID];
#endif
  [self.bannerView loadRequest:GADRequest.request];
  [self.activityIndicatorView startAnimating];
}

- (GADAdSize)adSize {
  return self.bannerView.adSize;
}

- (void)setAdSize:(GADAdSize)adSize {
  if (GADAdSizeEqualToSize(self.adSize, adSize)) {
    return;
  }

  self.bannerView.adSize = adSize;
}

- (UIViewController*)rootViewController {
  return self.bannerView.rootViewController;
}

- (void)setRootViewController:(UIViewController*)rootViewController {
  if (self.rootViewController == rootViewController) {
    return;
  }

  self.bannerView.rootViewController = rootViewController;
}

// MARK:- GADBannerViewDelegate
- (void)adViewDidReceiveAd:(GADBannerView*)bannerView {
  if (bannerView != self.bannerView) {
    return;
  }

#if TARGET_IPHONE_SIMULATOR
  self.debugLabel.text =
      [NSString stringWithFormat:@"AdUnitID: '%@'.", self.adUnitID];
#endif
  [self.activityIndicatorView stopAnimating];
}

- (void)adView:(GADBannerView*)bannerView
    didFailToReceiveAdWithError:(GADRequestError*)error {
  if (bannerView != self.bannerView) {
    return;
  }

#if TARGET_IPHONE_SIMULATOR
  self.debugLabel.text = [NSString
      stringWithFormat:@"AdUnitID: '%@' - error: '%@'.", self.adUnitID, error];
#endif
  NDLogWarning(@"AdUnitID: '%@' - error: '%@'.", self.adUnitID, error);
  [self.activityIndicatorView stopAnimating];
}

@end
