//
//  NDManualTableViewController+NDGoogleMobileAdsUtils.mm
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDGoogleMobileAdsUtils/NDManualTableViewController+NDGoogleMobileAdsUtils.h>

#import <NDGoogleMobileAdsUtils/NDAdMobAdView.h>
#import <NDGoogleMobileAdsUtils/NDAdMobAdViewContainer.h>

#import <NDUtils/NDUtils.h>

@implementation NDManualTableViewController (NDGoogleMobileAdsUtils)

- (void)enableAdMobViewContainerTableViewCell {
  auto hanlder = self.prepareCellForRowAtIndexPathHandler;
  self.prepareCellForRowAtIndexPathHandler = ^(
      __kindof NDManualTableViewController* controller,
      __kindof UITableViewCell* cell, NSIndexPath* _Nonnull indexPath) {
    NDCallIfCan(hanlder, controller, cell, indexPath);
    if ([cell conformsToProtocol:@protocol(NDAdMobAdViewContainer)]) {
      ((id<NDAdMobAdViewContainer>)cell).adView.rootViewController = controller;
    }
  };
}

@end
