import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ads_flutter/screens/interstitial_ads/interstitial_ads_viewmodel.dart';

class InterstitialAdsView extends StatelessWidget {
  InterstitialAdsView({super.key});

  final InterstitialAdsViewModel viewModel =
      Get.put(InterstitialAdsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(
          () => ElevatedButton(
            onPressed: viewModel.isloaded.value
                ? () {
                    if (viewModel.isloaded.value) {
                      viewModel.interstitialAd.show();
                    }
                  }
                : () {
                    print(viewModel.isloaded.value);
                  },
            child: const Text("Task Completed"),
          ),
        ),
      ),
    );
  }
}
