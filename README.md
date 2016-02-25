Cordova iAd plugin
====================

# Overview #
Show iad banner ad

[ios] [crodova cli] [xdk] [cocoon] [phonegap build service]

Requires apple developer account https://developer.apple.com/devcenter/ios/index.action

This is open source cordova plugin.

You can see Cordova Plugins in one page: http://cranberrygame.github.io?referrer=github

# Change log #
```c
```
# Install plugin #

## Cordova cli ##
https://cordova.apache.org/docs/en/edge/guide_cli_index.md.html#The%20Command-Line%20Interface - npm install -g cordova@6.0.0
```c
cordova plugin add cordova-plugin-ad-iad
(when build error, use github url: cordova plugin add cordova plugin add https://github.com/cranberrygame/cordova-plugin-ad-iad)
```

## Xdk ##
https://software.intel.com/en-us/intel-xdk - Download XDK - XDK PORJECTS - [specific project] - CORDOVA HYBRID MOBILE APP SETTINGS - Plugin Management - Add Plugins to this Project - Third Party Plugins -
```c
Plugin Source: Cordova plugin registry
Plugin ID: cordova-plugin-ad-iad
```

## Cocoon ##
https://cocoon.io - Create project - [specific project] - Setting - Plugins - Custom - Git Url: https://github.com/cranberrygame/cordova-plugin-ad-iad.git - INSTALL - Save<br>

## Phonegap build service (config.xml) ##
https://build.phonegap.com/ - Apps - [specific project] - Update code - Zip file including config.xml
```c
<gap:plugin name="cordova-plugin-ad-iad" source="npm" />

```

## Construct2 ##
Download construct2 plugin<br>
https://dl.dropboxusercontent.com/u/186681453/pluginsforcordova/index.html<br>
How to install c2 native plugins in xdk, cocoon and cordova cli<br>
https://plus.google.com/102658703990850475314/posts/XS5jjEApJYV

# Server setting #
```c
```

# API #
```javascript

document.addEventListener("deviceready", function(){

	window.iad.setUp();

	//
	window.iad.onBannerAdPreloaded = function() {
		alert('onBannerAdPreloaded');
	};
	window.iad.onBannerAdLoaded = function() {
		alert('onBannerAdLoaded');
	};
	window.iad.onBannerAdShown = function() {
		alert('onBannerAdShown');
	};
	window.iad.onBannerAdHidden = function() {
		alert('onBannerAdHidden');
	};	
}, false);

window.iad.preloadBannerAd();//option, download ad previously for fast show
/*
position: 'top-left', 'top-center', 'top-right', 'left', 'center', 'right', 'bottom-left', 'bottom-center', 'bottom-right'
*/
window.iad.showBannerAd('top-center');
window.iad.showBannerAd('bottom-center');
window.iad.reloadBannerAd();
window.iad.hideBannerAd();

alert(window.iad.loadedBannerAd());//boolean: true or false

alert(window.iad.isShowingBannerAd());//boolean: true or false
```
# Examples #
<a href="https://github.com/cranberrygame/cordova-plugin-ad-iad/blob/master/example/basic/index.html">example/basic/index.html</a><br>

# Test #

# Useful links #

Cordova Plugins<br>
http://cranberrygame.github.io?referrer=github

# Credits #
