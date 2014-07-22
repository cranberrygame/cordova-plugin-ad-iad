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
