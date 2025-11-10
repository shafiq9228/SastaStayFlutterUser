import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:get/get.dart';

import '../pages/amenities_page.dart';
import 'custom_network_image.dart';


class AmenitiesComponent extends StatelessWidget {
  final String? hostelId;
  final AmenitiesModel? amenitiesModel;
  final int view;
  const AmenitiesComponent({super.key,required this.amenitiesModel, required this.view,this.hostelId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(hostelId != null){
          Get.to(() =>  AmenitiesPage(hostelId: hostelId ?? ""));
        }
      },
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            decoration: view == 1 ? BoxDecoration(borderRadius: BorderRadius.circular(20),color: CustomColors.lightGray) : BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(width: 0.5,color: CustomColors.textColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomNetworkImage(imageUrl: amenitiesModel?.image ?? '',width: 18,height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(amenitiesModel?.name ?? '',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: CustomColors.textColor),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}