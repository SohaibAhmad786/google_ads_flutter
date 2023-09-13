import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeViewModel extends GetxController {
  late BannerAd bannerAd;
  RxBool isloaded = false.obs;
  var adunit = "ca-app-pub-3940256099942544/6300978111";

  @override
  void onInit() {
    super.onInit();
    initalizeBanner();
  }

  initalizeBanner() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adunit,
      listener: BannerAdListener(
        onAdClicked: (ad) {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              content: Text("banner click"),
            ),
          );
        },
        onAdLoaded: (ad) {
          isloaded.value=true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("Error Occurred:: $error");
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }
}
