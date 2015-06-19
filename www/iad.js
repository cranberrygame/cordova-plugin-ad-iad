
module.exports = {
	_loadedBannerAd: false,
	_isShowingBannerAd: false,
	//
	setLicenseKey: function(email, licenseKey) {
		var self = this;	
        cordova.exec(
            null,
            null,
            'iAd',
            'setLicenseKey',			
            [email, licenseKey]
        ); 
    },
	setUp: function() {
		var self = this;	
        cordova.exec(
            function (result) {
				if (typeof result == "string") {
					if (result == "onBannerAdPreloaded") {					
						if (self.onBannerAdPreloaded)
							self.onBannerAdPreloaded();
					}
					else if (result == "onBannerAdLoaded") {
						self._loadedBannerAd = true;
						
						if (self.onBannerAdLoaded)
							self.onBannerAdLoaded();
					}
					else if (result == "onBannerAdShown") {
						self._loadedBannerAd = false;
						self._isShowingBannerAd = true;
					
						if (self.onBannerAdShown)
							self.onBannerAdShown();
					}
					else if (result == "onBannerAdHidden") {
						self._isShowingBannerAd = false;
					
						 if (self.onBannerAdHidden)
							self.onBannerAdHidden();
					}					
				}
				else {
					//if (result["event"] == "onXXX") {
					//	//result["message"]
					//	if (self.onXXX)
					//		self.onXXX(result);
					//}
				}			
			}, 
			function (error) {
			},
            'iAd',
            'setUp',			
            []
        ); 
    },
	preloadBannerAd: function() {
		var self = this;	
        cordova.exec(
            null,
            null,
            'iAd',
            'preloadBannerAd',
            []
        ); 
    },
    showBannerAd: function(position) {
		var self = this;	
        cordova.exec(
            null,
            null,
            'iAd',
            'showBannerAd',
            [position]
        ); 
    },
	reloadBannerAd: function() {
		var self = this;	
        cordova.exec(
            null,
            null,
            'iAd',
            'reloadBannerAd',
            []
        ); 
    },
    hideBannerAd: function() {
		var self = this;
        cordova.exec(
            null,
            null,
            'iAd',
            'hideBannerAd',
            []
        ); 
    },
	loadedBannerAd: function() {
		return this._loadedBannerAd;
	},
	isShowingBannerAd: function() {
		return this._isShowingBannerAd;
	},
	onBannerAdPreloaded: null,
	onBannerAdLoaded: null,
	onBannerAdShown: null,
	onBannerAdHidden: null
};
