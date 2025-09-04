import 'package:flutter/material.dart';
import 'package:pg_hostel/response_model/auth_response_model.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/utils/custom_colors.dart';



class NotificationComponent extends StatelessWidget {
  final NotificationModel? notificationModel;
  const NotificationComponent({super.key, this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
      child: Container(
          decoration: AppStyles.categoryBg4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              children: [
                Container(decoration: AppStyles.whiteCircleBg, child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/bell.png",width: 20,height: 20,),
                )),
                Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notificationModel?.title ?? "",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: CustomColors.primary)),
                      SizedBox(height: 5),
                      Text(notificationModel?.body ?? "",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.textColor)),
                    ],
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
