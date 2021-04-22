//
//  ViewController.swift
//  Samples
//
//  Created by Nguyen Duc Hiep on 14/01/2021.
//

import NDAutolayoutUtils
import NDGoogleMobileAdsUtils

class ViewController: UIViewController {
  let adView = NDAdMobNativeAdView()

  override func viewDidLoad() {
    super.viewDidLoad()

    adView.adUnitID = "ca-app-pub-3940256099942544/3986624511"
    adView.adSize = GADAdSizeFromCGSize(.init(width: 320, height: 150))
    adView.rootViewController = self
    adView.nativeAdView = GADTSmallTemplateView()
    view.nd_fill(with: adView)
  }
}
