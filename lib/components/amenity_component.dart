import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../response_model/hostel_response_model.dart';
import '../utils/custom_colors.dart';
import '../view_models/auth_view_model.dart';
import 'custom_network_image.dart';

class AmenityComponent extends StatelessWidget {
  final AmenitiesModel? amenitiesModel;
  const AmenityComponent({super.key, required this.amenitiesModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:3,horizontal: 15),
      child: Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: CustomColors.textColor)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomNetworkImage(
                imageUrl: amenitiesModel?.image ?? "", width: 30, height: 30),
            const SizedBox(width: 10),
            Expanded(child: Text(
              amenitiesModel?.name ?? "", textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.textColor),))
          ],
        ),
      ),
    ),
    );
  }
}
