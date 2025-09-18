import 'package:flutter/material.dart';
import 'package:pg_hostel/pages/main_page.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../request_model/auth_request_model.dart';
import '../utils/auth_utils.dart';
import '../view_models/auth_view_model.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final authViewModel = Get.put(AuthViewModel());


  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () async {
        await  authViewModel.fetchCurrentLocation();
        final version = await AuthUtils.getAppVersion();
        await authViewModel.validateVersion(ValidateVersionRequestModel(version: version));
          // Future.delayed(const Duration(seconds: 2), () { Get.offAll(() =>  const MainPage()); });
      },
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: Center(
          child:
          IntrinsicHeight(
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset("assets/images/splash.png"),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sasta',
                        style: TextStyle(color: CustomColors.textColor, fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      TextSpan(
                        text: 'Stays',
                        style: TextStyle(color: CustomColors.primary, fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
