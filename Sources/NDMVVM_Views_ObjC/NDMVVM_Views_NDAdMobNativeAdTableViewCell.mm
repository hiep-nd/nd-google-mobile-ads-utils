//
//  NDMVVM_Views_NDAdMobNativeAdTableViewCell.mm
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 14/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDGoogleMobileAdsUtils/NDMVVM_Views_NDAdMobNativeAdTableViewCell.h>

#import <NDGoogleMobileAdsUtils/NDAdMobNativeAdView.h>
#import <NDGoogleMobileAdsUtils/NDMVVM_Abstracts_NDAdMobAdUnitItemViewModel.h>

#import <NDAutolayoutUtils/NDAutolayoutUtils.h>

#import <NDMVVM/Abstracts_Privates_NDViewDefaultImpl.h>

@implementation NDAdMobNativeAdTableViewCell

- (__kindof NDAdMobNativeAdView*)createNativeAdView {
  NDAssertionFailure(
      @"Miscalled abstract method '%s'. Must be implemented in sub class '%@'.",
      __PRETTY_FUNCTION__, NSStringFromClass(self.class));
  return [[NDAdMobNativeAdView alloc] init];
}

// MARK: - NDManualTableViewCell
- (void)manualInit {
  [super manualInit];

  self.backgroundColor = UIColor.clearColor;
  self.selectionStyle = UITableViewCellSelectionStyleNone;

  _nativeAdView = [self createNativeAdView];
  [self.contentView nd_fillWithContentView:self.nativeAdView];
  _heightConstraint = [self.contentView.heightAnchor
      constraintEqualToConstant:self.nativeAdView.adSize.size.height];
  self.heightConstraint.priority = 999;
  self.heightConstraint.active = YES;
}

- (void)didSetViewModelFromOldViewModel:(__kindof id<NDViewModel>)oldViewModel {
  [super didSetViewModelFromOldViewModel:oldViewModel];
  self.nativeAdView.adUnitID = RViewModel(self).adUnitID;
  self.nativeAdView.adSize = RViewModel(self).adSize;
  self.heightConstraint.constant = RViewModel(self).adSize.size.height;
}

// MARK:- NDAdMobViewContainer
- (__kindof id<NDAdMobAdView>)adView {
  return self.nativeAdView;
}

// MARK:- Privates
NDView_RViewModel_Default_Impl(NDAdMobAdUnitItemViewModel);

@end

#import <NDGoogleMobileAdsUtils/GADTSmallTemplateView.h>

@implementation NDAdMobSmallTemplateNativeAdTableViewCell

- (__kindof NDAdMobNativeAdView*)createNativeAdView {
  auto view = [[NDAdMobNativeAdView alloc] init];
  view.unifiedNativeAdView = [[GADTSmallTemplateView alloc] init];
  return view;
}

@end
