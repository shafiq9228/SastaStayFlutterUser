import 'package:flutter/material.dart';
import 'package:pg_hostel/pages/booking_confirmed_page.dart';
import 'package:pg_hostel/response_model/bookings_response_model.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/utils/auth_utils.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:get/get.dart';
import '../pages/booking_details_page.dart';
import '../response_model/hostel_response_model.dart';
import 'animated_tap.dart';
import 'custom_network_image.dart';

class BookingDetailsComponent extends StatefulWidget {
  final BookingModel? bookingModel;
  const BookingDetailsComponent({super.key, required this.bookingModel});

  @override
  State<BookingDetailsComponent> createState() => _BookingDetailsComponentState();
}

class _BookingDetailsComponentState extends State<BookingDetailsComponent> {

  @override
  Widget build(BuildContext context) {
    HostelModel hostelModel = HostelModel.fromJson(widget.bookingModel?.hostelId);
    RoomModel roomModel = RoomModel.fromJson(widget.bookingModel?.roomId);


    return AnimatedTap(
      onTap: (){
        //Get.to(() => BookingConfirmedPage(bookingId: widget.bookingModel?.id ?? ""));
        Get.to(() => BookingDetailsPage(bookingId: widget.bookingModel?.id ?? ""));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: Container(
          color: CustomColors.white,
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomNetworkImage(imageUrl: hostelModel.hostelImage ?? "",fit: BoxFit.cover,width: 100,height: 100),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(hostelModel.hostelName ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.black,fontSize: 18)),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/location.png",width: 15,height: 15,color: CustomColors.darkGray),
                                  SizedBox(width: 5),
                                  Expanded(child: Text(hostelModel.location?.address1 ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: CustomColors.darkGray))),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/bed.png",width: 15,height: 15,color: CustomColors.darkGray),
                                  SizedBox(width: 5),
                                  Expanded(child: Text("${roomModel.roomNo ?? ""} | ${roomModel.floor ?? 0} | ${roomModel.roomType ?? ""}",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: CustomColors.darkGray))),
                                ],
                              ),
                            ),
                            Container(decoration: AppStyles.gradient,child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              child: Text("${AuthUtils.dateFormatToCheckInCheckOut1(widget.bookingModel?.checkInDate,widget.bookingModel?.checkOutDate)}",style: TextStyle(color: CustomColors.primary,fontSize: 12,fontWeight: FontWeight.w400)),
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Booking ID",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: CustomColors.darkGray),),
                          Text(widget.bookingModel?.id ?? "",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.textColor)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(color:
                      CustomColors.darkGray,height: 10,width: 1),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Amount Paid",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: CustomColors.darkGray)),
                          Text("${widget.bookingModel?.subTotal ?? 0}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.textColor)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(color:
                        CustomColors.darkGray,height: 10,width: 1),
                    ),
                    Expanded(
                      child: widget.bookingModel?.paymentStatus == "success" ? Container(
                        decoration: widget.bookingModel?.bookingStatus == "Ongoing" ? AppStyles.categoryBg2 : widget.bookingModel?.bookingStatus == "Upcoming" ? AppStyles.categoryBg4 : AppStyles.categoryBg1,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Text(widget.bookingModel?.bookingStatus ?? '',style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.textColor),),
                          ),
                        ),
                      ) : Text(widget.bookingModel?.paymentStatus ?? '',style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.orange)),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Text("Booked On : ${AuthUtils.formatDateToLong(widget.bookingModel?.createdAt)}",style: TextStyle(color: CustomColors.textColor,fontSize: 12,fontWeight: FontWeight.w400)),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
