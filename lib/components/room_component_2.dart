import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/primary_button.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/utils/app_styles.dart';

import '../utils/custom_colors.dart';
import 'custom_network_image.dart';
import 'hostel_room_availability_bottom_sheet.dart';

class RoomComponent2 extends StatelessWidget {
  final RoomModel? roomModel;
  const RoomComponent2({super.key, required this.roomModel});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: Container(
        decoration: AppStyles.categoryBg4,
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child:CustomNetworkImage(imageUrl: roomModel?.image ?? 'https://i.pinimg.com/originals/5b/81/5f/5b815fa3c99fc946d20070770857e829.png',width: double.infinity,height: 150,fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 10),
                    Text(roomModel?.roomType ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: CustomColors.black)),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text("Room No. : ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.black)),
                        Expanded(child: Text(roomModel?.roomNo ?? "",textAlign: TextAlign.right,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.black))),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text("Floor : ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.black)),
                        Expanded(child: Text((roomModel?.floor ?? 0) == 0 ? "Ground Floor" : "${roomModel?.floor ?? 0} Floor",textAlign: TextAlign.right,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.black))),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text("Guests Capacity : ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.black)),
                        Expanded(child: Text("${roomModel?.capacityCount ?? 0}",textAlign: TextAlign.right,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.black))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text("₹${roomModel?.rent?.daily ?? ""}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.black)),
                        Text("/Daily",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray)),
                        Spacer(),
                        Text("",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text("₹${roomModel?.rent?.monthly ?? ""}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.black)),
                        Text("/Monthly",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray)),
                        Spacer(),
                        Text("",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    PrimaryButton(buttonTxt: "Check Availability",buttonClick: (){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true, // allows full height scroll
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) {
                          return HostelRoomAvailabilityBottomSheet(roomModel: roomModel);
                        },
                      );
                    }),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

}
