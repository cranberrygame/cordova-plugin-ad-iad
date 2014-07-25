// Copyright (c) 2014 cranberrygame
// Email: cranberrygame@yahoo.com
// Phonegap plugin: http://www.github.com/cranberrygame
// Construct2 phonegap plugin: https://www.scirra.com/forum/viewtopic.php?f=153&t=109586
//                             https://dl.dropboxusercontent.com/u/186681453/index.html
//                             https://www.scirra.com/users/cranberrygame
// Facebook: https://www.facebook.com/profile.php?id=100006204729846
// License: MIT (http://opensource.org/licenses/MIT)
#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
//
#import <iAd/iAd.h>

@interface iAd : CDVPlugin <ADBannerViewDelegate>

@property ADBannerView *bannerView;
@property NSString *position;

- (void)preloadBannerAd: (CDVInvokedUrlCommand*)command;
- (void)showBannerAd: (CDVInvokedUrlCommand*)command;
- (void)hideBannerAd: (CDVInvokedUrlCommand*)command;
- (void)refreshBannerAd: (CDVInvokedUrlCommand*)command;

@end
