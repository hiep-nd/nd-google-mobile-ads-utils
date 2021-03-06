//
//  NDAdMobNativeAdView.m
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDGoogleMobileAdsUtils/NDAdMobNativeAdView.h>

#import <NDGoogleMobileAdsUtils/UILabel+NDGoogleMobileAdsUtils.h>

#import <NDAutolayoutUtils/NDAutolayoutUtils.h>
#import <NDUtils/NDUtils.h>

using namespace nd::objc;

@interface NDAdMobNativeAdView () <GADNativeAdLoaderDelegate,
                                   GADNativeAdDelegate>
@end

@implementation NDAdMobNativeAdView {
  GADAdLoader* _adLoader;
  GADNativeAd* _nativeAd;
  NSLayoutConstraint* _widthConstraint;
  NSLayoutConstraint* _heightConstraint;
}

- (void)setNativeAdView:(GADNativeAdView*)nativeAdView {
  if (_nativeAdView == nativeAdView) {
    return;
  }

  [_nativeAdView removeFromSuperview];
  _widthConstraint.active = NO;
  _heightConstraint.active = NO;

  _nativeAdView = nativeAdView;
  _widthConstraint = [_nativeAdView.widthAnchor
      constraintEqualToConstant:self.adSize.size.width];
  _heightConstraint = [_nativeAdView.heightAnchor
      constraintEqualToConstant:self.adSize.size.height];
  if (_nativeAdView) {
    [self nd_wrapItem:_nativeAdView
        visualConstraints:@[
          @"V:[safeArea_center][item_center]",
          @"V:[safeArea_top]->=0-[item]->=0-[safeArea_bottom]",
          @"H:[safeArea_center][item_center]",
          @"H:[safeArea_leading]->=0-[item]->=0-[safeArea_trailing]",
        ]];
    _widthConstraint.active = YES;
    _heightConstraint.active = YES;
    _nativeAdView.nativeAd = _nativeAd;
    _nativeAdView.hidden = (_nativeAd == nil);
    [self sendSubviewToBack:_nativeAdView];
  }
}

// MARK:- NSManualView
- (void)manualInit {
  [super manualInit];

  _activityIndicatorView = [[UIActivityIndicatorView alloc]
      initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
#if TARGET_IPHONE_SIMULATOR
  _debugLabel = [UILabel nd_adMobDebuggerLabel];
#endif
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

@synthesize adUnitID = _adUnitID;

- (void)setAdUnitID:(NSString*)adUnitID {
  if (SameOrEquals(adUnitID, _adUnitID)) {
    return;
  }

  _adUnitID = [adUnitID copy];

  [self loadAd];
}

@synthesize adSize = _adSize;

- (void)setAdSize:(GADAdSize)adSize {
  if (GADAdSizeEqualToSize(adSize, _adSize)) {
    return;
  }

  _adSize = adSize;
  _widthConstraint.constant = adSize.size.width;
  _heightConstraint.constant = adSize.size.height;
}

@synthesize rootViewController = _rootViewController;

- (void)setRootViewController:(UIViewController*)rootViewController {
  if (_rootViewController == rootViewController) {
    return;
  }

  _rootViewController = rootViewController;

  [self loadAd];
}

@synthesize activityIndicatorView = _activityIndicatorView;

#if TARGET_IPHONE_SIMULATOR
@synthesize debugLabel = _debugLabel;
#endif

// MARK:- GADNativeAdLoaderDelegate
- (void)adLoader:(GADAdLoader*)adLoader
    didReceiveNativeAd:(GADNativeAd*)nativeAd {
  self.nativeAd = nativeAd;
}

- (void)adLoaderDidFinishLoading:(nonnull GADAdLoader*)adLoader {
  if (adLoader != _adLoader) {
    return;
  }
  [self.activityIndicatorView stopAnimating];
}

- (void)adLoader:(nonnull GADAdLoader*)adLoader
    didFailToReceiveAdWithError:(nonnull NSError*)error {
  if (adLoader != _adLoader) {
    return;
  }

#if TARGET_IPHONE_SIMULATOR
  self.debugLabel.text = [NSString
      stringWithFormat:@"AdUnitID: '%@' - error: '%@'.", self.adUnitID, error];
#endif
  NDLogWarning(@"AdUnitID: '%@' - error: '%@'.", self.adUnitID, error);
  self.nativeAd = nil;
}

// MARK:- Privates
- (void)loadAd {
  _adLoader =
      [[GADAdLoader alloc] initWithAdUnitID:self.adUnitID
                         rootViewController:self.rootViewController
                                    adTypes:@[ kGADAdLoaderAdTypeNative ]
                                    options:nil];
  _adLoader.delegate = self;
#if TARGET_IPHONE_SIMULATOR
  self.debugLabel.text =
      [NSString stringWithFormat:@"AdUnitID: '%@'.", self.adUnitID];
#endif
  [self.activityIndicatorView startAnimating];
  [_adLoader loadRequest:GADRequest.request];
}

- (void)setNativeAd:(GADNativeAd*)nativeAd {
  if (_nativeAd == nativeAd) {
    return;
    ;
  }

  _nativeAd = nativeAd;
  _nativeAdView.nativeAd = _nativeAd;
  _nativeAdView.hidden = (_nativeAd == nil);
}

@end
