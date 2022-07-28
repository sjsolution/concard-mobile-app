import 'package:concard/Views/screens/homeScreens/companyPremiumPlan/upgradeCompanyPlanScreen.dart';
import 'package:concard/Views/screens/homeScreens/upgradeCompanyPremium/upgradeCompanyPremium.dart';
import 'package:flutter/services.dart';
import 'package:concard/Views/screens/intialScreens/splashScreen.dart';
import 'package:flutter/material.dart';
// import 'firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}
