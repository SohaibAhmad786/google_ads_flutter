import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ads_flutter/screens/home_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  var deviceIds = ["48DCB5588CE90C88E6292FF3B205D6D2"];
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: deviceIds);
  await MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeView(),
    );
  }
}
