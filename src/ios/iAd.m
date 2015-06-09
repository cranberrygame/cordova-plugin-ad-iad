// Copyright (c) 2014 cranberrygame
// Email: cranberrygame@yahoo.com
// Phonegap plugin: http://www.github.com/cranberrygame
// Construct2 phonegap plugin: https://www.scirra.com/forum/viewtopic.php?f=153&t=109586
//                             https://dl.dropboxusercontent.com/u/186681453/index.html
//                             https://www.scirra.com/users/cranberrygame
// Facebook: https://www.facebook.com/profile.php?id=100006204729846
// License: MIT (http://opensource.org/licenses/MIT)
#import "iAd.h"
//
#import "MainViewController.h"

@implementation iAd

@synthesize bannerView;
@synthesize position;

- (CDVPlugin *)initWithWebView:(UIWebView *)theWebView {
    self = (iAd *)[super initWithWebView:theWebView];
    if (self) {
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(deviceOrientationChangeiAd:)
         name:UIDeviceOrientationDidChangeNotification
         object:nil];
    }
    return self;
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

- (void)preloadBannerAd: (CDVInvokedUrlCommand*)command {
    //self.viewController
    //
	//NSString *adUnit = [command.arguments objectAtIndex: 0];
	//NSLog(@"%@", adUnit);

	[self _preloadBannerAd];
    
	[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
	//[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR] callbackId:command.callbackId];
}

- (void)showBannerAd: (CDVInvokedUrlCommand*)command {
    //self.viewController
    //
	NSString *position = [command.arguments objectAtIndex: 0];
	NSLog(@"%@", position);

	[self _showBannerAd:position];
    
	[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
	//[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR] callbackId:command.callbackId];
}

- (void)hideBannerAd: (CDVInvokedUrlCommand*)command {
    //self.viewController
    //
	//NSString *position = [command.arguments objectAtIndex: 0];
	//NSLog(@"%@", position);

	[self _hideBannerAd];
    
	[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
	//[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR] callbackId:command.callbackId];
}
- (void)refreshBannerAd: (CDVInvokedUrlCommand*)command {
    //self.viewController
    //
	//NSString *position = [command.arguments objectAtIndex: 0];
	//NSLog(@"%@", position);
	
	[self _refreshBannerAd];
	
	[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
	//[self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR] callbackId:command.callbackId];
}

//-------------------------------------------------------------------

- (void) _preloadBannerAd
{
    if (bannerView == nil)
    {
		bannerView = [[ADBannerView alloc] initWithFrame:CGRectZero]; 
		bannerView.delegate = self;
	}
}
- (void) _showBannerAd:(NSString *)position
{
	if (bannerView == nil)
	{
		[self _preloadBannerAd];
	}

    [self _hideBannerAd];
	
	self.position = position;
	
    CGRect bannerFrame = bannerView.frame;
	if ([position isEqualToString:@"top"]) {
		    
		bannerFrame.origin.y = 0;
	}
	else {
		bannerFrame.origin.y = self.webView.frame.size.height - bannerView.frame.size.height;
	}
    bannerFrame.origin.x = self.webView.frame.size.width * 0.5f - bannerView.frame.size.width * 0.5f;
    bannerView.frame = bannerFrame;
    //https://developer.apple.com/library/ios/documentation/uikit/reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/cl/UIView
	[self.webView addSubview:bannerView];
}
- (void) _hideBannerAd
{
    if (bannerView != nil)
    {
        //https://developer.apple.com/library/ios/documentation/uikit/reference/UIView_Class/UIView/UIView.html#//apple_ref/occ/cl/UIView
        [self.bannerView removeFromSuperview];
	}
}
- (void) _refreshBannerAd
{
	if (bannerView != nil)
	{
		[self _hideBannerAd];

		bannerView = nil;
		
		[self _showBannerAd:self.position];
	}
}
		
//ADBannerViewDelegate
- (void)bannerViewDidLoadAd:(ADBannerView *)banner 
{
    bannerView.hidden = NO;
    NSLog(@"bannerViewDidLoadAd");
}
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    bannerView.hidden = YES;
    NSLog(@"bannerView");
}
- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    NSLog(@"bannerViewActionDidFinish");
}
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    NSLog(@"bannerViewActionShouldBegin");
    
    return willLeave;
}
- (void)bannerViewWillLoadAd:(ADBannerView *)banner
{
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
