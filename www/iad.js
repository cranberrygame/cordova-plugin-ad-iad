
module.exports = {
   
	preloadBannerAd: function(successCallback, errorCallback) {
        cordova.exec(
            successCallback,
            errorCallback,
            'iAd',
            'preloadBannerAd',
            []
        ); 
    },
    showBannerAd: function(position, successCallback, errorCallback) {
        cordova.exec(
            successCallback,
            errorCallback,
            'iAd',
            'showBannerAd',
            [position]
        ); 
    },
    hideBannerAd: function(successCallback, errorCallback) {
        cordova.exec(
            successCallback,
            errorCallback,
            'iAd',
            'hideBannerAd',
            []
        ); 
    },
	refreshBannerAd: function(successCallback, errorCallback) {
        cordova.exec(
            successCallback,
            errorCallback,
            'iAd',
            'refreshBannerAd',
            []
        ); 
    },	
	//
	preloadFullScreenAd: function(successCallback, errorCallback) {
        cordova.exec(
            successCallback,
            errorCallback,
            'iAd',
            'preloadFullScreenAd',
            []
        ); 
    },
    showFullScreenAd: function(successCallback, errorCallback) {
        cordova.exec(
            successCallback,
            errorCallback,
            'iAd',
            'showFullScreenAd',
            []
        ); 
    },
	refreshFullScreenAd: function(successCallback, errorCallback) {
        cordova.exec(
            successCallback,
            errorCallback,
            'iAd',
            'refreshFullScreenAd',
            []
        ); 
    }	
};
