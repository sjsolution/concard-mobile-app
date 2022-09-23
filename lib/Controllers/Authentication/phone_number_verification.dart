import 'dart:developer';

import 'package:concard/Constants/globals.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companyCodeVerification.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/resetPasswordScreen.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/codeVerification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneNumberVerification {
  String? phoneNumber = '+923077985653';
  final FirebaseAuth auth = FirebaseAuth.instance;
  int? _forceResendingToken;
  Future verifyPhoneNumber(
      String number, BuildContext context, String type) async {
    debugPrint(number.toString());
    await auth.verifyPhoneNumber(
        phoneNumber: number,
        forceResendingToken: _forceResendingToken,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!
          showToastMethod(msg: "Verification Auto Complete");
          // Sign the user in (or link) with the auto-generated credential
          // await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          debugPrint("Exception Code:" + e.toString());
          if (e.code == 'invalid-phone-number') {
            debugPrint('The provided phone number is not valid.');
            showToastMethod(msg: "The provided phone number is not valid.");
          }
          context.read<AppProvider>().setLoadingFalse();
          // Handle other errors
        },
        codeSent: (String verificationId, int? resendToken) async {
          debugPrint("verificationId:$verificationId");
          showToastMethod(
              msg:
                  "Code is sent to the provided phone number. Please check and verify");

          // Update the UI - wait for the user to enter the SMS code
          // String smsCode = 'xxxx';
          context.read<AppProvider>().setLoadingFalse();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => type == "1"
                      ? CodeVerification(sentCode: verificationId, type: number,verifType:"phone")
                      : type == "2"
                          ? CompanyCodeVerificationScreen(
                              sentCode: verificationId, type: number,verifType:"phone")
                          : ResetPasswordScreen(
                              sentCode: verificationId, type: number,verifType:"phone")));
          // Create a PhoneAuthCredential with the code

          _forceResendingToken = resendToken;

          // Sign the user in (or link) with the credential
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          showToastMethod(msg: "Something went wrong . Please try again later");
          context.read<AppProvider>().setLoadingFalse();
          // Auto-resolution timed out...
        },
        timeout: const Duration(seconds: 20));
  }
}
