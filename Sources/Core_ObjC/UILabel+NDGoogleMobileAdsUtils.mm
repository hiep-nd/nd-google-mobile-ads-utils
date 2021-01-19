//
//  UILabel+NDGoogleMobileAdsUtils.mm
//  NDGoogleMobileAdsUtils
//
//  Created by Nguyen Duc Hiep on 13/01/2020.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <NDGoogleMobileAdsUtils/UILabel+NDGoogleMobileAdsUtils.h>

#import <NDUtils/NDUtils.h>

@implementation UILabel (NDGoogleMobileAdsUtils)

+ (instancetype)nd_adMobDebuggerLabel {
  UILabel* obj = [[self alloc] init];
  obj.textColor = [UIColor nd_withRgba:0xFF0000A0];
  obj.font = [UIFont systemFontOfSize:320];
  obj.adjustsFontSizeToFitWidth = YES;
  obj.numberOfLines = 0;
  [obj setContentHuggingPriority:UILayoutPriorityFittingSizeLevel
                         forAxis:UILayoutConstraintAxisHorizontal];
  [obj setContentHuggingPriority:UILayoutPriorityFittingSizeLevel
                         forAxis:UILayoutConstraintAxisVertical];
  [obj
      setContentCompressionResistancePriority:UILayoutPriorityFittingSizeLevel
                                      forAxis:UILayoutConstraintAxisHorizontal];
  [obj setContentCompressionResistancePriority:UILayoutPriorityFittingSizeLevel
                                       forAxis:UILayoutConstraintAxisVertical];
  return obj;
}
@end
