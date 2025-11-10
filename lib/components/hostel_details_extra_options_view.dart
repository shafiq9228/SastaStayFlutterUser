import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/cancellation_policy_page.dart';
import 'error_text_component.dart';

class HostelDetailsExtraOptionsView extends StatelessWidget {
  final List<String>? rules;
  final String? checkInTime;
  final String? checkOutTime;
  final String mobileNumber;
  const HostelDetailsExtraOptionsView({super.key, this.rules, this.checkInTime, this.checkOutTime, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: mobileNumber.toString().trim().isNotEmpty,
          child: InkWell(
              onTap: (){
                openWhatsAppChat(phoneNumber: mobileNumber.toString());
              },
              child: const ErrorTextComponent(assetImage: "assets/images/chat.png",text: "Have Queries? Here to help")),
        ),
        const SizedBox(height: 20),
        Text("Rules & Policies",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.textColor,fontSize: 18)),
        SizedBox(height: 10),
        Visibility(
          visible: (rules ?? []).isNotEmpty,
          child: slideComponent("Rules",(rules ?? []).join(","),(){

          }),
        ) ,
        slideComponent("Cancellation Policy","Free cancellation up to 48 hours before check-in",(){
          Get.to(() => const CancellationPolicyPage());
        }),
        slideComponent("Check-in / Check-out Times","${checkInTime ?? ""} - ${checkOutTime ?? ""}",(){

        }),

      ],
    );
  }

  Future<void> openWhatsAppChat({
    required String phoneNumber, // in international format without '+'
    String message = '',
  }) async {
    final Uri whatsappUri = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}",
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  Widget slideComponent(String title,String message,VoidCallback  onClick){
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.textColor,fontSize: 16)),
                  Text(message,maxLines: 5,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.darkGray,fontSize: 14)),
                ],
              ),
            ),
            Image.asset("assets/images/right_arrow.png",width: 20,height: 20)
          ],
        ),
      ),
    );
  }
}
