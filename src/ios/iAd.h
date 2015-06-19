//Copyright (c) 2014 Sang Ki Kwon (Cranberrygame)
//Email: cranberrygame@yahoo.com
//Homepage: http://cranberrygame.github.io
//License: MIT (http://opensource.org/licenses/MIT)
#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
//
#import <iAd/iAd.h>

@interface iAd : CDVPlugin <ADBannerViewDelegate>

@property NSString *callbackIdKeepCallback;
//
@property NSString *email;
@property NSString *licenseKey_;
@property BOOL validLicenseKey;
//
@property NSString *bannerPreviousPosition;
//
@property BOOL bannerAdPreload;
//
@property ADBannerView *bannerView;

- (void) setLicenseKey: (CDVInvokedUrlCommand*)command;
- (void) setUp:(CDVInvokedUrlCommand*)command;
- (void) preloadBannerAd: (CDVInvokedUrlCommand*)command;
- (void) showBannerAd: (CDVInvokedUrlCommand*)command;
- (void) reloadBannerAd: (CDVInvokedUrlCommand*)command;
- (void) hideBannerAd: (CDVInvokedUrlCommand*)command;

@end
