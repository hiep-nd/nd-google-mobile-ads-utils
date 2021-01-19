//
//  NDMVVM_Views_NDAdMobBannerTableViewCell.mm
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDGoogleMobileAdsUtils/NDMVVM_Views_NDAdMobBannerTableViewCell.h>

#import <NDGoogleMobileAdsUtils/NDAdMobBannerView.h>
#import <NDGoogleMobileAdsUtils/NDMVVM_Abstracts_NDAdMobAdUnitItemViewModel.h>

#import <NDAutolayoutUtils/NDAutolayoutUtils.h>

#import <NDMVVM/Abstracts_Privates_NDViewDefaultImpl.h>

@implementation NDAdMobBannerTableViewCell

// MARK: - NDManualTableViewCell
- (void)manualInit {
  [super manualInit];

  self.backgroundColor = UIColor.clearColor;
  self.selectionStyle = UITableViewCellSelectionStyleNone;

  _bannerView = [[NDAdMobBannerView alloc] init];
  [self.contentView nd_fillWithContentView:self.bannerView];

  _heightConstraint = [self.contentView.heightAnchor
      constraintEqualToConstant:self.bannerView.adSize.size.height];
  self.heightConstraint.priority = 999;
  self.heightConstraint.active = YES;
}

- (void)didSetViewModelFromOldViewModel:(__kindof id<NDViewModel>)oldViewModel {
  [super didSetViewModelFromOldViewModel:oldViewModel];
  self.bannerView.adUnitID = RViewModel(self).adUnitID;
  self.bannerView.adSize = RViewModel(self).adSize;
  self.heightConstraint.constant = RViewModel(self).adSize.size.height;
}

// MARK:- NDAdMobViewContainer
- (__kindof id<NDAdMobAdView>)adView {
  return self.bannerView;
}

// MARK:- Privates
NDView_RViewModel_Default_Impl(NDAdMobAdUnitItemViewModel);

@end
