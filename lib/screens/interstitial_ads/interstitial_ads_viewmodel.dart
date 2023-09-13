import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdsViewModel extends GetxController {
  late InterstitialAd interstitialAd;
  RxBool isloaded = false.obs;
  var adunit = "ca-app-pub-3940256099942544/1033173712";

  @override
  void onInit() {
    super.onInit();
    initalizeBanner();
  }

  initalizeBanner() {
    InterstitialAd.load(
      adUnitId: adunit,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd=ad;
          isloaded.value = true;
          interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              isloaded.value = false;
              Get.back();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              isloaded.value = false;
              Get.back();
            },
          );
        },
        onAdFailedToLoad: (error) {
          interstitialAd.dispose();
          print(error);
        },
      ),
    );
  }
}
