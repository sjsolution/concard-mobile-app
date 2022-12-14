
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Controllers/providers/about_provider.dart';
import 'package:concard/Views/screens/authScreens/company/signup/aboutCompanySignup.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companMobileVerification.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companyAdminSignup.dart';
import 'package:concard/Views/screens/authScreens/company/signup/selectBuisness.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/singIn.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/basicDetail.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/mobileVerification.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/signup_choice_class.dart';
import 'package:concard/Views/screens/authScreens/signupScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:concard/Views/screens/intialScreens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:concard/Controllers/providers/story_provider.dart';
// import 'firebase_options.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
//         final isValidHost = ["192.168.1.67"].contains(host); // <-- allow only hosts in array
//         return isValidHost;
//       });
//   }
// }

Future<void> main(List<String> args) async {
  // HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  
 

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => StoryProvider()),
        ChangeNotifierProvider(create: (context) => AboutProvider()),
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
