import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/pages/refer_and_earn_page.dart';
import 'package:pg_hostel/utils/custom_colors.dart';

class StaticReferAndEarnComponent extends StatelessWidget {
  const StaticReferAndEarnComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: CustomColors.primary),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Row(
              children: [
                Spacer(),
                Image.asset("assets/images/refer_and_earn.png",height: 100)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text("Refer Friends & Earn Wallet Credits",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.white,fontSize: 18)),
                   const SizedBox(height: 10),
                   Text("Earn ₹100 for every friend who signs up and books their first hostel stay!",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.white,fontSize: 16)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.to(() => ReferAndEarnPage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(color: CustomColors.white,borderRadius: BorderRadius.circular(20)),
                            child:Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Text("Refer Now!",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.textColor,fontSize: 16)),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
