import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/custom_colors.dart';



class UserBlocked extends StatelessWidget {
  const UserBlocked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Center(
          child: IntrinsicHeight(
            child: Column(
              children: [
                Image.asset('assets/images/user_bloked.png',width: 100,height: 100,),
                const SizedBox(height: 30),
                Text("You Have Blocked By Admin",textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 16,
                    color: CustomColors.primary,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal
                )),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: launchEmail,
                  child:  Text("Please Contact admin for support \n sastastay@gmail.com",textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 16,
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal
                  )),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final String email = 'sastastay@gmail.com';
  final String subject = 'Blocked';
  final String body = '';

  Future<void> launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      Get.snackbar("Could not launch","Could not launch Email",snackPosition: SnackPosition.BOTTOM,backgroundColor:CustomColors.secondary,colorText: Colors.white);
      throw 'Could not launch $emailUri';
    }
  }
}
