import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/view_models/booking_view_model.dart';

import '../response_model/bookings_response_model.dart';
import '../utils/custom_colors.dart';

class AddGuestItem extends StatelessWidget {
  final int index;
  final  GuestDetailsModel guestDetailsModel;
  const AddGuestItem({super.key,required this.guestDetailsModel, required this.index});

  @override
  Widget build(BuildContext context) {
    final bookingViewModel = Get.put(BookingViewModel());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        color: CustomColors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(guestDetailsModel.name ?? '',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: CustomColors.textColor)),
                      Text("${guestDetailsModel.gender ?? ""} | ${guestDetailsModel.dob ?? ""} | ${guestDetailsModel.mobile ?? ""}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.textColor)),
                    ],
                  ),
                ),
              ),
              IconButton(onPressed: (){
                  bookingViewModel.guestDetailsList.removeAt(index);
              }, icon: Icon(Icons.delete_outline,size: 15))
            ],
          ),
        ),
      ),
    );
  }
}
