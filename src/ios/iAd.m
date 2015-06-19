//Copyright (c) 2014 Sang Ki Kwon (Cranberrygame)
//Email: cranberrygame@yahoo.com
//Homepage: http://cranberrygame.github.io
//License: MIT (http://opensource.org/licenses/MIT)
#import "iAd.h"
//
#import "MainViewController.h"
#import <CommonCrypto/CommonDigest.h> //md5

@implementation iAd

@synthesize callbackIdKeepCallback;
//
@synthesize email;
@synthesize licenseKey_;
@synthesize validLicenseKey;
//
@synthesize bannerPreviousPosition;
//
@synthesize bannerAdPreload;
//
@synthesize bannerView;

- (void)pluginInitialize {
	[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(deviceOrientationChangeiAd:)
	 name:UIDeviceOrientationDidChangeNotification
	 object:nil];
}

- (void)deviceOrientationChangeiAd:(NSNotification *)notification{
    if (bannerView != nil)
    {
        CGRect bannerFrame = bannerView.frame;
        if (bannerFrame.origin.y != 0)
        {
            bannerFrame.origin.y = self.webView.frame.size.height - bannerView.frame.size.height;
        }
        bannerFrame.origin.x = self.webView.frame.size.width * 0.5f - bannerView.frame.size.width * 0.5f;
        bannerView.frame = bannerFrame;
    }
}

- (bool)_isLandscape {
    bool landscape = NO;
        
    UIDeviceOrientation currentOrientation = [[UIDevice currentDevice] orientation];
    if (UIInterfaceOrientationIsLandscape(currentOrientation)) {
        landscape = YES;
    }
    return landscape;
}

- (void) setLicenseKey: (CDVInvokedUrlCommand*)command {
    NSString *email = [command.arguments objectAtIndex: 0];
    NSString *licenseKey = [command.arguments objectAtIndex: 1];
    NSLog(@"%@", email);
    NSLog(@"%@", licenseKey);
    
    [self.commandDelegate runInBackground:^{
        [self _setLicenseKey:email aLicenseKey:licenseKey];
    }];
}

- (void) setUp: (CDVInvokedUrlCommand*)command {
    //self.viewController
    //self.webView
    //NSString *adUnitBanner = [command.arguments objectAtIndex: 0];
    //NSString *adUnitFullScreen = [command.arguments objectAtIndex: 1];
    //BOOL isOverlap = [[command.arguments objectAtIndex: 2] boolValue];
    //BOOL isTest = [[command.arguments objectAtIndex: 3] boolValue];
	//NSArray *zoneIds = [command.arguments objectAtIndex:4];	
    //NSLog(@"%@", adUnitBanner);
    //NSLog(@"%@", adUnitFullScreen);
    //NSLog(@"%d", isOverlap);
    //NSLog(@"%d", isTest);
	
    self.callbackIdKeepCallback = command.callbackId;
	
    [self.commandDelegate runInBackground:^{
		[self _setUp];	
    }];
}

- (void)preloadBannerAd: (CDVInvokedUrlCommand*)command {

    [self.commandDelegate runInBackground:^{
		[self _preloadBannerAd];
    }];
}

- (void)showBannerAd: (CDVInvokedUrlCommand*)command {
	NSString *position = [command.arguments objectAtIndex: 0];
	NSLog(@"%@", position);

    //[self.commandDelegate runInBackground:^{
		[self _showBannerAd:position];
    //}];
}

- (void)reloadBannerAd: (CDVInvokedUrlCommand*)command {

    //[self.commandDelegate runInBackground:^{
		[self _reloadBannerAd];
    //}];
}

- (void)hideBannerAd: (CDVInvokedUrlCommand*)command {

    //[self.commandDelegate runInBackground:^{
		[self _hideBannerAd];
    //}];
}

//-------------------------------------------------------------------

- (void) _setLicenseKey:(NSString *)email aLicenseKey:(NSString *)licenseKey {
	self.email = email;
	self.licenseKey_ = licenseKey;

/*	
	//
	NSString *str1 = [self md5:[NSString stringWithFormat:@"cordova-plugin-: %@", email]];
	NSString *str2 = [self md5:[NSString stringWithFormat:@"cordova-plugin-ad-iad: %@", email]];
	NSString *str3 = [self md5:[NSString stringWithFormat:@"com.cranberrygame.cordova.plugin.: %@", email]];
	NSString *str4 = [self md5:[NSString stringWithFormat:@"com.cranberrygame.cordova.plugin.ad.iad: %@", email]];
	if(licenseKey_ != Nil && ([licenseKey_ isEqualToString:str1] || [licenseKey_ isEqualToString:str2] || [licenseKey_ isEqualToString:str3] || [licenseKey_ isEqualToString:str4])){
		self.validLicenseKey = YES;
		NSArray *excludedLicenseKeys = [NSArray arrayWithObjects: @"xxx", nil];
		for (int i = 0 ; i < [excludedLicenseKeys count] ; i++) {
			if([[excludedLicenseKeys objectAtIndex:i] isEqualToString:licenseKey]) {
				self.validLicenseKey = NO;
				break;
			}
		}
	}
	else {
		self.validLicenseKey = NO;
	}
	if (self.validLicenseKey)
		NSLog(@"valid licenseKey");
	else {
		NSLog(@"invalid licenseKey");
		//UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Cordova Admob: invalid email / license key. You can get free license key from https://play.google.com/store/apps/details?id=com.cranberrygame.pluginsforcordova" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		//[alert show];		
	}
*/
	self.validLicenseKey = YES;	
}

- (NSString*) md5:(NSString*) input {
	const char *cStr = [input UTF8String];
	unsigned char digest[16];
	CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call

	NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

	for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
	[output appendFormat:@"%02x", digest[i]];

	return  output;
}

- (void) _setUp {
	if (!validLicenseKey) {
		if (arc4random() % 100 <= 1) {//0 ~ 99			
			//
		}
	}
	
	//
}

- (void) _preloadBannerAd {
	self.bannerAdPreload = YES;
	
	[self _hideBannerAd];
	
	[self loadBannerAd];
}

- (void) loadBannerAd {
    if (bannerView == nil) {
		bannerView = [[ADBannerView alloc] initWithFrame:CGRectZero]; 
		bannerView.delegate = self;
	}
}

- (void) _showBannerAd:(NSString *)position {

	if ([self bannerIsShowingOverlap] && [position isEqualToString:self.bannerPreviousPosition]) {
		return;
	}
	
	self.bannerPreviousPosition = position;

	if(bannerAdPreload) {
		bannerAdPreload = NO;
	}
	else{
		[self _hideBannerAd];
		
		[self loadBannerAd];
	}
		
	[self addBannerViewOverlap:position];
	
	CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"onBannerAdShown"];
	[pr setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pr callbackId:self.callbackIdKeepCallback];
	//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
	//[pr setKeepCallbackAsBool:YES];
	//[[self.plugin getCommandDelegate] sendPluginResult:pr callbackId:[self.plugin getCallbackIdKeepCallback]];	
}

- (BOOL) bannerIsShowingOverlap {
	//
	BOOL bannerIsShowing = NO;
	if (bannerView != nil) {
		//if banner is showing			
		//if ([bannerView isDescendantOfView:webView]) {
		UIView* webView = [bannerView superview];
		if (webView != nil) {
			bannerIsShowing = YES;
		}
	}

	return bannerIsShowing;
}

- (void) addBannerViewOverlap:(NSString*)position {
	
///*
    CGRect bannerFrame = bannerView.frame;
	if ([position isEqualToString:@"top-center"]) {		    
		bannerFrame.origin.y = 0;
	}
	else {
		bannerFrame.origin.y = self.webView.frame.size.height - bannerView.frame.size.height;
	}
    bannerFrame.origin.x = self.webView.frame.size.width * 0.5f - bannerView.frame.size.width * 0.5f;
    bannerView.frame = bannerFrame;
    //https://developer.apple.com/library/ios/documentation/uikit/reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/cl/UIView
	[self.webView addSubview:bannerView];
//*/
/*
     CGFloat width = self.webView.bounds.size.width;
     CGFloat height = self.webView.bounds.size.height;
     if ([position isEqualToString:@"top-center"]) {
        bannerView.frame = CGRectMake(0, 0, width, 50);
     }
     else {
        bannerView.frame = CGRectMake(0, height - 50, width, 50);
     }
     //bannerView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
     [self.webView addSubview:bannerView];
*/
}

- (void) _reloadBannerAd {

    [self loadBannerAd];	
}

- (void) _hideBannerAd {
	[self _removeBannerViewOverlap];
	
	CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"onBannerAdHidden"];
	[pr setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pr callbackId:self.callbackIdKeepCallback];
	//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
	//[pr setKeepCallbackAsBool:YES];
	//[[self.plugin getCommandDelegate] sendPluginResult:pr callbackId:[self.plugin getCallbackIdKeepCallback]];	
}

- (void)_removeBannerViewOverlap {
    if (bannerView == nil)
		return;
		
    //[self.bannerView removeFromSuperview];
	//if banner is showing
	UIView* webView = [bannerView superview];
	if (webView != nil) {
		//https://developer.apple.com/library/ios/documentation/uikit/reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/cl/UIView
		[self.bannerView removeFromSuperview];
		bannerView = nil;
	}
}
		
//ADBannerViewDelegate
- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    NSLog(@"bannerViewDidLoadAd");
	
	if(bannerAdPreload) {
		CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"onBannerAdPreloaded"];
		[pr setKeepCallbackAsBool:YES];
		[self.commandDelegate sendPluginResult:pr callbackId:callbackIdKeepCallback];
		//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
		//[pr setKeepCallbackAsBool:YES];
		//[self.commandDelegate sendPluginResult:pr callbackId:callbackIdKeepCallback];
	}
	
	CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"onBannerAdLoaded"];	
	[pr setKeepCallbackAsBool:YES];
	[self.commandDelegate sendPluginResult:pr callbackId:callbackIdKeepCallback];
	//CDVPluginResult* pr = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
	//[pr setKeepCallbackAsBool:YES];
	//[self.commandDelegate sendPluginResult:pr callbackId:callbackIdKeepCallback];
	
	bannerView.hidden = NO;	
}
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"bannerView");

    bannerView.hidden = YES;
}
- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
    NSLog(@"bannerViewActionDidFinish");
}
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    NSLog(@"bannerViewActionShouldBegin");
    
    return willLeave;
}
- (void)bannerViewWillLoadAd:(ADBannerView *)banner {
    NSLog(@"bannerViewWillLoadAd");
}

- (void)dealloc {
	[[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UIDeviceOrientationDidChangeNotification
     object:nil];
}

@end
