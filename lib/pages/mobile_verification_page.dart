import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:truecaller_sdk/truecaller_sdk.dart';

import '../api/api_result.dart';
import '../components/custom_progress_bar.dart';
import '../components/primary_button.dart';
import '../request_model/auth_request_model.dart';
import '../utils/app_styles.dart';
import '../utils/auth_utils.dart';
import '../utils/custom_colors.dart';
import '../utils/statefullwrapper.dart';
import '../view_models/auth_view_model.dart';
import 'terms_and_condition_page.dart';

class MobileVerificationPage extends StatefulWidget {
  const MobileVerificationPage({super.key});

  @override
  State<MobileVerificationPage> createState() =>
      _MobileVerificationPageState();
}

class _MobileVerificationPageState extends State<MobileVerificationPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthViewModel authViewModel = Get.put(AuthViewModel());

  final TextEditingController mobileNumberText =
  TextEditingController();

  StreamSubscription? _tcStreamSub;

  String? _codeVerifier;
  String? _oAuthState;

  // Store Truecaller profile data
  Map<String, dynamic>? _truecallerProfileData;

  @override
  void initState() {
    super.initState();

    /// Initialize Truecaller SDK
    TcSdk.initializeSDK(
      sdkOption: TcSdkOptions.OPTION_VERIFY_ALL_USERS,
    );

    _tcStreamSub =
        TcSdk.streamCallbackData.listen(_onTruecallerCallback);
  }

  @override
  void dispose() {
    _tcStreamSub?.cancel();
    mobileNumberText.dispose();
    super.dispose();
  }

  // ===================== TRUECALLER LOGIN =====================
  Future<void> signInWithTrueCaller() async {
    try {

      final isUsable = await TcSdk.isOAuthFlowUsable;
      if (!isUsable) {
        Get.snackbar(
          "Not Supported",
          "Truecaller not available on this device",backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM
        );
        return;
      }

      _oAuthState = DateTime.now().millisecondsSinceEpoch.toString();
      TcSdk.setOAuthState(_oAuthState!);
      TcSdk.setOAuthScopes(['profile','phone', 'openid','email']);

      _codeVerifier = await TcSdk.generateRandomCodeVerifier;
      final codeChallenge = await TcSdk.generateCodeChallenge(_codeVerifier!);


      if (codeChallenge == null) {
        Get.snackbar("Error", "Truecaller not supported",backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
        return;
      }

      TcSdk.setCodeChallenge(codeChallenge);
      TcSdk.getAuthorizationCode;
    } catch (e) {

      debugPrint("Truecaller Login Error: $e");
    }
  }

  void _onTruecallerCallback(TcSdkCallback tcSdkCallback) {
    switch (tcSdkCallback.result) {
      case TcSdkCallbackResult.success:
        final TcOAuthData data = tcSdkCallback.tcOAuthData!;
        debugPrint("Authorization Code: ${data.authorizationCode}");
        print("_codeVerifier ${_codeVerifier}");

        AuthUtils.getAppVersion().then((version) async {
          String? deviceId = await AuthUtils.getDeviceId();
          String source = await AuthUtils.getSource();
          authViewModel.trueCallerLogin(TrueCallerRequestModel(authorizationCode: data.authorizationCode, codeVerifier:_codeVerifier, source: source, version: version, deviceId:deviceId));
        });

        break;
      case TcSdkCallbackResult.failure:
        debugPrint("Truecaller Error: ${tcSdkCallback.error?.message}");
        Get.snackbar(
          "Error",
          tcSdkCallback.error?.message ?? "Truecaller authentication failed", backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM
        );
        break;

      case TcSdkCallbackResult.verification:
        debugPrint("Truecaller verification required");
        Get.snackbar(
          "Verification Required",
          "Please verify your Truecaller account", backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM
        );
        break;

      default:
        break;
    }
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value.isNotEmpty ? value : "Not available"),
          ),
        ],
      ),
    );
  }


  Future<User?> signInWithGoogle() async {
    try {
      await logoutEmail();
      authViewModel.emailVerificationObserver.value =
      const ApiResult.loading("");

      final GoogleSignInAccount? googleUser =
      await _googleSignIn.signIn();

      if (googleUser == null) {
        await logoutEmail();
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final OAuthCredential credential =
      GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      // Get Google user profile data
      final User? user = userCredential.user;
      if (user != null) {
        _handleGoogleSuccess(user);
      }

      authViewModel.sendEmailVerification(
        userCredential.user?.email ?? "",
      );

      return userCredential.user;
    } catch (e) {
      debugPrint("Google Login Error: $e");
      await logoutEmail();
      return null;
    }
  }

  void _handleGoogleSuccess(User user) {
    // Extract data from Google user
    String email = user.email ?? "";
    String displayName = user.displayName ?? "";
    String firstName = "";
    String lastName = "";

    // Split display name into first and last name
    if (displayName.isNotEmpty) {
      List<String> nameParts = displayName.split(' ');
      firstName = nameParts.isNotEmpty ? nameParts[0] : "";
      lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : "";
    }

    //Phone number might not be available from Google
    String phoneNumber = user.phoneNumber ?? mobileNumberText.text;

    // Show collected data
    Get.snackbar(
      "Success!",
      "Logged in with Google",duration: const Duration(seconds: 3),backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM
    );

    // Update mobile text field if empty
    if (mobileNumberText.text.isEmpty && phoneNumber.isNotEmpty) {
      mobileNumberText.text = phoneNumber;
    }

    // TODO: Send Google data to backend
    // authViewModel.googleLogin(
    //   email: email,
    //   firstName: firstName,
    //   lastName: lastName,
    //   phone: phoneNumber,
    // );
  }

  Future<void> logoutEmail() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      authViewModel.emailVerificationObserver.value =
      const ApiResult.init();
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: StatefulWrapper(
        onInit: () {},
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: const [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Enter your Login Information",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// PHONE INPUT
                const Text(
                  "Phone Number",
                  style:
                  TextStyle(fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 50,
                    decoration: AppStyles.editTextBg,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: mobileNumberText,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        counterText: "",
                        hintText: "Enter Your Mobile Number",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                /// OR DIVIDER
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              height: 1,
                              color: CustomColors.darkGray)),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Text("Or"),
                      ),
                      Expanded(
                          child: Container(
                              height: 1,
                              color: CustomColors.darkGray)),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: signInWithGoogle,
                  child: Container(
                    height: 40,
                    decoration: AppStyles.googleContainerStyle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                                "assets/images/google.png")),
                        const SizedBox(width: 10),
                        const Text("Continue With Google"),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                if(Platform.isAndroid) Obx(() => authViewModel.trueCallerVerificationObserver.value.maybeWhen(
                  loading: (cd) => Center(child: CircularProgressIndicator()),
                    orElse: () => GestureDetector(
                  onTap: signInWithTrueCaller,
                  child: Container(
                    height: 40,
                    decoration: AppStyles.trueCallerContainerStyle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                                "assets/images/truecaller.webp")),
                        SizedBox(width: 10),
                        Text("Continue With Truecaller",style: TextStyle(fontSize: 16,color: CustomColors.white),),
                      ],
                    ),
                  ),
                ))
                ),

                const Spacer(),

                /// TERMS
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
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const TermsAndConditionsPage());
                              },
                            text:
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

                /// OTP BUTTON
                Obx(() => authViewModel
                    .sendOtpResponseObserver.value
                    .maybeWhen(
                  loading: (_) =>
                  const CustomProgressBar(),
                  orElse: () => PrimaryButton(
                    buttonTxt: "Log In",
                    buttonClick: () {
                      authViewModel.sendOtp(
                        SendOtpRequestModel(
                          mobile: int.tryParse(
                              mobileNumberText.text),
                        ),
                      );
                    },
                  ),
                )),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}