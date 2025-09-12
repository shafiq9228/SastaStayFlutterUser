import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/utils/custom_colors.dart';

class ReferAndEarnComponent extends StatelessWidget {
  final int count;
  final int outOff;
  const ReferAndEarnComponent({super.key, required this.count, required this.outOff});

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
                  Text("Invite 3 Friends & Get",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.white,fontSize: 18)),
                  const SizedBox(height: 10),
                  Text("Earn ₹30 off – Refer 3 friends & save!",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.white,fontSize: 16)),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10,height: 50),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Invites Send",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.white,fontSize: 12)),
                                Spacer(),
                                Text("${count}/${outOff}",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.white,fontSize: 12)),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: count / outOff,
                                minHeight: 8,
                                color: CustomColors.yellow,
                                backgroundColor: Colors.grey.shade300, // optional
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 100,height: 50)
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
