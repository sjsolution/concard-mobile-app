import 'package:concard/Controllers/compnayControllers/about_compnay.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/company/signup/aboutCompanySignup.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companMobileVerification.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companyAdminSignup.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companyCodeVerification.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companySignupHomeScreen.dart';
import 'package:concard/Views/screens/authScreens/company/signup/selectBuisness.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/singIn.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/basicDetail.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/codeVerification.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/mobileVerification.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/signup_choice_class.dart';
import 'package:concard/Views/screens/authScreens/signupScreen.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/createTeamScreen.dart';
import 'package:concard/Views/screens/homeScreens/companyPremiumPlan/upgradeCompanyPlanScreen.dart';
import 'package:concard/Views/screens/homeScreens/upgradeCompanyPremium/upgradeCompanyPremium.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:concard/Views/screens/intialScreens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:concard/Controllers/providers/story_provider.dart';
// import 'firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => StoryProvider()),
      ],
      child: MaterialApp(
        title: "Concard",
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/indiBasic': (context) => IndividualBasicDetail(),
          '/indiCodeSend': (context) => const NumberVerification(),
          '/signIn': (context) => const SignIn(),
          '/choiceClass': (context) => const SignupChoiceClass(),
          '/companyBusinessType': (context) => SelectBuisness(),
          '/compnaySigup': (context) => CompanyAdminSignup(), //CompanySignUpHomeScreen(),
          '/aboutCompany': (context) => AboutCompanySignup(),
          '/companyMobileVeri': (context) => const CompanyMobileVerification(),
          '/intialScreen': (context) => const SignupScreen(),

          // '/indiCodeVerif':(context)=> CodeVerification(),
        },

        // home:  SplashScreen(),
      ),
    );
  }
}
