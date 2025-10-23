import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pg_hostel/response_model/auth_response_model.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:pg_hostel/components/refer_and_earn_component.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/utils/custom_colors.dart';

import '../response_model/hostel_response_model.dart';
import '../view_models/auth_view_model.dart';

class ReferAndEarnPage extends StatefulWidget {
  const ReferAndEarnPage({super.key});

  @override
  State<ReferAndEarnPage> createState() => _ReferAndEarnPageState();
}

class _ReferAndEarnPageState extends State<ReferAndEarnPage> {
  final authViewModel = Get.put(AuthViewModel());
  String referCode = "";
  final imageTextList = [
    TitleMessageModel(image: "assets/images/copy.png", message: "Copy"),
    TitleMessageModel(image: "assets/images/whatsapp.png", message: "Whatsapp"),
    TitleMessageModel(image: "assets/images/instagram.png", message: "Instagram")
  ];

  void _handleAction(String action) async {
    if (action == "Copy") {
      await Clipboard.setData(ClipboardData(text: referCode));
      Get.snackbar("Copied","Referral code copied to clipboard",backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
    }
    else if (action == "Whatsapp" || action == "Instagram") {
      try {
        // Load image from assets
        final byteData = await rootBundle.load('assets/images/refer.webp');
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/refer.png');
        await file.writeAsBytes(byteData.buffer.asUint8List());

        const appLink = "https://play.google.com/store/apps/details?id=com.sastastay.user";

        // Message with clickable referral code and link
        final text = "Hey! 👋\n\n"
            "Use my referral code 👉 *$referCode* to join the app and get rewards!\n\n"
            "Download the app here:\n$appLink";

        // Share to WhatsApp or Instagram
        await Share.shareXFiles(
          [XFile(file.path)],
          text: text,
          subject: "Join Now!",
        );
      } catch (e) {
        Get.snackbar(
          "Error",
          "Unable to share via $action",
          backgroundColor: CustomColors.primary,
          colorText: CustomColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: StatefulWrapper(
        onInit: (){
          setState(() {
            referCode = authViewModel.fetchUserDetailsObserver.value.whenOrNull(success: (data) => (data as FetchUserDetailsResponseModel).data?.referralCode) ?? "SASTASTAY";
          });
        },
        child: SafeArea(
          top: true,
          child: Column(
            children: [
              const SecondaryHeadingComponent(buttonTxt: "Refer And Earn"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReferAndEarnComponent(count:(authViewModel.fetchUserDetailsObserver.value.whenOrNull(success: (data) => (data as FetchUserDetailsResponseModel).data?.referrals) ?? []).length,authViewModel: authViewModel),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Referral Code : ${referCode}",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.textColor,fontSize: 16)),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Referral Earnings : ₹${(authViewModel.fetchUserDetailsObserver.value.whenOrNull(success: (data) => (data as FetchUserDetailsResponseModel).data?.referralEarnings) ?? 0)}",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.textColor,fontSize: 16)),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: imageTextList.length,
                            itemBuilder: (context, index) {
                              final itemModel = imageTextList[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () => _handleAction(itemModel.message ?? ""),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: AppStyles.whiteCircleBg,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Image.asset(
                                            itemModel.image ?? "",
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        itemModel.message ?? "",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: CustomColors.textColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
