import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ads_flutter/screens/home_viewmodel.dart';
import 'package:google_ads_flutter/screens/interstitial_ads/interstitial_ads_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeViewModel viewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(
            child: Text("Banner Ads Example in Flutter"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => InterstitialAdsView());
            },
            child: const Text("Interstitial App Page"),
          )
        ],
      ),
      bottomNavigationBar: Obx(
        () => viewModel.isloaded.value
            ? SizedBox(
                height: viewModel.bannerAd.size.height.toDouble(),
                width: viewModel.bannerAd.size.width.toDouble(),
                child: AdWidget(
                  ad: viewModel.bannerAd,
                ),
              )
            : const SizedBox(
                child: Text("No Ads available", textAlign: TextAlign.center),
              ),
      ),
    );
  }
}
