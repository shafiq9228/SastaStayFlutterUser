import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../api/api_result.dart';
import '../components/custom_progress_bar.dart';
import '../components/primary_button.dart';
import '../request_model/auth_request_model.dart';
import '../utils/app_styles.dart';
import '../utils/auth_utils.dart';
import '../utils/custom_colors.dart';
import '../view_models/auth_view_model.dart';

class MobileVerificationPage extends StatelessWidget {
  MobileVerificationPage({super.key});

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final authViewModel = Get.put(AuthViewModel());


  @override
  Widget build(BuildContext context) {

    final TextEditingController mobileNumberText = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SafeArea(top: true,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical:20,horizontal: 20),
        child: Text("Login / SignUp",style: TextStyle(color: CustomColors.primary,fontWeight: FontWeight.w500,fontSize: 22),),
      ),
      Container(width: double.infinity,height: 1,color: CustomColors.primary,),
          const SizedBox(height:30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Enter Your Mobile Number",style: TextStyle(color: CustomColors.textColor,fontWeight: FontWeight.w500,fontSize: 24),),
          ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: AppStyles.editTextBg,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      controller: mobileNumberText,
                      style: TextStyle(
                          color:CustomColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Enter Your Mobile Number',
                      hintStyle: const TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w500),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Default color
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: CustomColors.white, width: 2.0), // Focus color
                      ),
                    )
                  ),
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: const TextStyle(height: 1.3),
                  children: [
                    TextSpan(text:
                    'By creating an account, I accept the', style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: CustomColors.textColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
                    TextSpan(text:
                    ' Terms & Conditions', style:TextStyle(
                      fontFamily: 'Montserrat',
                      color: CustomColors.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ))
                  ]),
            ),
            const SizedBox(height: 20),
            Obx(() => authViewModel.sendOtpResponseObserver.value.maybeWhen(
              loading: (loading) =>  const CustomProgressBar(),
                orElse: () => PrimaryButton(buttonTxt: "SEND OTP", buttonClick: () {
                 authViewModel.sendOtp(SendOtpRequestModel(mobile: mobileNumberText.text.trim().isEmpty ? null : int.parse(mobileNumberText.text)));
            },))
            ),
            Row(
              children: [
                Expanded(child: Container(height: 1,color: CustomColors.textColor)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                  child: Text("Or Continue With",style: TextStyle(color: CustomColors.textColor,fontWeight: FontWeight.w500,fontSize: 16),),
                ),
                Expanded(child: Container(height: 1,color: CustomColors.textColor)),
              ],
            ),
            Obx(() => authViewModel.googleAuthResponseObserver.value.maybeWhen(
                loading: (loading) => const CustomProgressBar(),
                error: (error) {
                  logoutEmail();
                  return GestureDetector(onTap:signInWithGoogle,
                    child: Container(
                      height: 40,
                      decoration: AppStyles.googleContainerStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width:20,height: 20,child: Image.asset("assets/images/google.png")),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text("Continue With Google",style: TextStyle(color: CustomColors.textColor,fontWeight: FontWeight.w400,fontSize: 14)),
                          )
                        ],),
                    ),
                  );
                },
                orElse: () => GestureDetector(onTap:signInWithGoogle,
                  child: Container(
                    height: 40,
                    decoration: AppStyles.googleContainerStyle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width:20,height: 20,child: Image.asset("assets/images/google.png")),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Continue With Google",style: TextStyle(color: CustomColors.textColor,fontWeight: FontWeight.w400,fontSize: 14)),
                        )
                      ],),
                  ),
                ))
            )
          ],
        ),
      )
    ],)),);
  }

  Future<User?> signInWithGoogle() async {
    try {
      authViewModel.googleAuthResponseObserver.value = const ApiResult.loading("");
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final version = await AuthUtils.getAppVersion();
      String? deviceId = await AuthUtils.getDeviceId();
      String sorce = await AuthUtils.getSource();
      authViewModel.googleAuth(GoogleAuthRequestModel(email: userCredential.user?.email ?? "", name: userCredential.user?.displayName ?? "",source:sorce, version:version,deviceId: deviceId));
      return userCredential.user;
    } catch (e) {
      print("Error during logout: $e");
      logoutEmail();
      return null;
    }
  }


  Future<void> logoutEmail() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      authViewModel.googleAuthResponseObserver.value = const ApiResult.init();
    } catch (e) {
      print("Error during logout: $e");
    }
  }

}
