Cordova iAd plugin
====================

# Overview #
Show iad banner ad

[ios] [crodova cli] [xdk] [cocoon]

Requires apple developer account https://developer.apple.com/devcenter/ios/index.action

This is open source cordova plugin.

You can see Plugins For Cordova in one page: http://cranberrygame.github.io?referrer=github

# Change log #
```c
```
# Install plugin #

## Cordova cli ##
https://cordova.apache.org/docs/en/edge/guide_cli_index.md.html#The%20Command-Line%20Interface - npm install -g cordova@5.0.0
```c
cordova plugin add cordova-plugin-ad-iad
```

## Xdk ##
https://software.intel.com/en-us/intel-xdk - Download XDK - XDK PORJECTS - [specific project] - CORDOVA 3.X HYBRID MOBILE APP SETTINGS - PLUGINS - Third Party Plugins - Add a Third Party Plugin - Get Plugin from the Web -
```c
Name: iad
Plugin ID: com.cranberrygame.cordova.plugin.ad.iad
[v] Plugin is located in the Apache Cordova Plugins Registry
```

## Cocoon ##
https://cocoon.io - Create project - [specific project] - Setting - Plugins - Custom - Git Url: https://github.com/cranberrygame/cordova-plugin-ad-iad.git - INSTALL - Save<br>

## Phonegap build service (config.xml) ##
https://build.phonegap.com/ - Apps - [specific project] - Update code - Zip file including config.xml
```c
<gap:plugin name="cordova-plugin-ad-iad" source="npm" />

```

## Construct2 ##
Download construct2 plugin: https://dl.dropboxusercontent.com/u/186681453/pluginsforcordova/index.html
<br>
Now all the native plugins are installed automatically: https://plus.google.com/102658703990850475314/posts/XS5jjEApJYV<br>
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

Plugins For Cordova<br>
http://cranberrygame.github.io?referrer=github

# Credits #
