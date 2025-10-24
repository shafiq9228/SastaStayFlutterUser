import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/components/add_guest_bottom_sheet.dart';
import 'package:pg_hostel/components/add_guest_item.dart';
import 'package:pg_hostel/components/custom_network_image.dart';
import 'package:pg_hostel/components/error_text_component.dart';
import 'package:pg_hostel/components/secondary_heading_component.dart';
import 'package:pg_hostel/pages/coupons_page.dart';
import 'package:pg_hostel/pages/rooms_list_page.dart';
import 'package:pg_hostel/pages/terms_and_condition_page.dart';
import 'package:pg_hostel/response_model/auth_response_model.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';
import 'package:pg_hostel/view_models/booking_view_model.dart';

import '../components/primary_button.dart';
import '../components/side_heading_component.dart';
import '../components/title_message_component.dart';
import '../response_model/bookings_response_model.dart';
import '../utils/app_styles.dart';
import '../utils/auth_utils.dart';


class CheckoutPage extends StatelessWidget {

  final HostelModel? hostelData;
  const CheckoutPage({super.key, required this.hostelData});

  @override
  Widget build(BuildContext context) {
    RxBool termsAndCondition = false.obs;
    final authViewModel = Get.put(AuthViewModel());
    final bookingViewModel = Get.put(BookingViewModel());

    return Scaffold(
      backgroundColor: CustomColors.white,
      body: StatefulWrapper(
        onInit: (){
        },
        onStart: (){
          bookingViewModel.checkHostelRoomAvailability(bookingViewModel.bookingRequestModelObserver.value,0);
        },
        child: SafeArea(
          top: true,
            child: Stack(
              children: [
                Column(
                  children: [
                    const SecondaryHeadingComponent(buttonTxt: "Checkout"),
                    Expanded(child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Container(
                              decoration: AppStyles.categoryBg3,
                              child:
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(hostelData?.hostelName ?? "",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: CustomColors.textColor)),
                                          SizedBox(height: 10),
                                          Text(hostelData?.location?.address1 ?? "",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: CustomColors.darkGray)),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Image.asset("assets/images/star.png",width: 18,height: 18),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: Text("${hostelData?.rating ?? 0}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,color: CustomColors.black)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ), CustomNetworkImage(imageUrl: hostelData?.hostelImage ?? "",width: 100,height: 100,fit: BoxFit.cover,)
                                  ]),
                              )
                            ),
                            SizedBox(height: 20),
                            Obx(() => bookingViewModel.bookingRequestModelObserver.value != null ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    width: double.infinity,
                                    color: CustomColors.lightGray,
                                    height: 5,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(child: Text("Your Booking Details",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: CustomColors.black))),
                                    const SizedBox(width: 20),
                                    InkWell(
                                        onTap: (){
                                          Get.to(() => RoomsListPage(hostelId: hostelData?.id ?? "",roomModel: bookingViewModel.bookingRequestModelObserver.value?.roomModel));
                                        },
                                        child: Text("Change",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: CustomColors.primary,decoration: TextDecoration.underline))),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                TitleMessageComponent(asset: 'assets/images/profile.png', title: 'Total Guests', message: "${bookingViewModel.bookingRequestModelObserver.value?.guestCount ?? 0}",),
                                // Obx(() => Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Text("${bookingViewModel.guestDetailsList.length}/${(bookingViewModel.bookingRequestModelObserver.value?.guestCount ?? 0)} Guests",style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.darkGray,fontSize: 14),),
                                //     SizedBox(height: 10),
                                //     bookingViewModel.guestDetailsList.length == 0 ? InkWell(
                                //       onTap: (){
                                //         showModalBottomSheet(
                                //           context: context,
                                //           isScrollControlled: true, // allows full height scroll
                                //           shape: const RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                //           ),
                                //           builder: (context) {
                                //             return const AddGuestBottomSheet();
                                //           },
                                //         );
                                //       },
                                //         child: ErrorTextComponent(text: "Add Guest Details")) :
                                //     ListView.builder(
                                //         shrinkWrap: true,
                                //         physics: NeverScrollableScrollPhysics(),
                                //         scrollDirection: Axis.vertical,
                                //         itemBuilder: (context,index){
                                //           final guestDetailsModel = bookingViewModel.guestDetailsList[index];
                                //           return InkWell(
                                //             onTap: (){
                                //               showModalBottomSheet(
                                //                 context: context,
                                //                 isScrollControlled: true, // allows full height scroll
                                //                 shape: const RoundedRectangleBorder(
                                //                   borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                //                 ),
                                //                 builder: (context) {
                                //                   return AddGuestBottomSheet(guestDetailsModel:guestDetailsModel);
                                //                 },
                                //               );
                                //             },
                                //               child: AddGuestItem(guestDetailsModel:guestDetailsModel,index: index));
                                //         },itemCount: bookingViewModel.guestDetailsList.length),
                                //     SizedBox(height: 10),
                                //     Visibility(visible: bookingViewModel.guestDetailsList.length < (bookingViewModel.bookingRequestModelObserver.value?.guestCount ?? 0),child:
                                //     InkWell(
                                //       onTap: (){
                                //         showModalBottomSheet(
                                //           context: context,
                                //           isScrollControlled: true, // allows full height scroll
                                //           shape: const RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                //           ),
                                //           builder: (context) {
                                //             return const AddGuestBottomSheet();
                                //           },
                                //         );
                                //       },
                                //         child: Text("+ Add New Guest",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: CustomColors.primary)))),
                                //     SizedBox(height: 20),
                                //   ],
                                // )),
                                DottedLine(
                                  dashColor: CustomColors.darkGray,
                                ),
                                TitleMessageComponent(asset: 'assets/images/booking.png', title: 'Dates', message: "${AuthUtils.formatDateToLong(bookingViewModel.bookingRequestModelObserver.value?.checkInDate)}" +" - " + "${AuthUtils.formatDateToLong(bookingViewModel.bookingRequestModelObserver.value?.checkOutDate)}",),
                                DottedLine(
                                  dashColor: CustomColors.darkGray,
                                ),
                                TitleMessageComponent(asset: 'assets/images/bed.png', title: 'Room Type', message: "${bookingViewModel.bookingRequestModelObserver.value?.roomModel?.roomType ?? ""}"),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    width: double.infinity,
                                    color: CustomColors.lightGray,
                                    height: 5,
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ) : const SizedBox(),
                            ),
                            ErrorTextComponent(assetImage: "assets/images/aadhar.png",text: "Carry your Aadhaar card to ensure smooth check-in."),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: double.infinity,
                                color: CustomColors.lightGray,
                                height: 5,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Obx(() {
                              return bookingViewModel.selectedCoupon.value != null ? InkWell(
                                onTap: (){
                                  Get.to(() =>  CouponsPage(selecting: true,hostelId: hostelData?.id ?? ""));
                                },
                                child: Container(
                                  decoration: AppStyles.editTextBg,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.local_offer,size: 15,color: CustomColors.primary),
                                            const SizedBox(width: 5),
                                            Text(
                                                '${bookingViewModel.selectedCoupon.value?.code ?? ""} ',
                                                style:  TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: CustomColors.textColor)),
                                            Text(
                                                ' Coupon applied',
                                                style:  TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: CustomColors.textColor)),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text('View all offers',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                decoration: TextDecoration.underline,
                                                color: CustomColors.primary))
                                      ],
                                    ),
                                  ),
                                ),
                              ) :
                              InkWell(
                                onTap: (){
                                  Get.to(() => CouponsPage(selecting: true,hostelId: hostelData?.id ?? ""));
                                },
                                child: Container(
                                  decoration: AppStyles.editTextBg,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.local_offer_outlined,size: 15,color: CustomColors.textColor),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              child: Text(
                                                  'Apply Coupon',
                                                  style:  TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      color: CustomColors.textColor)),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text('View all offers',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                decoration: TextDecoration.underline,
                                                color: CustomColors.primary))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: double.infinity,
                                color: CustomColors.lightGray,
                                height: 5,
                              ),
                            ),
                            Obx(() {
                            final walletBalance = authViewModel.fetchUserDetailsObserver.value.whenOrNull(
                              success: (data) =>
                              (data as FetchUserDetailsResponseModel).data?.wallet,
                            ) ?? 0;

                            return Visibility(
                              visible: walletBalance != 0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Wallet Info
                                        Row(
                                          children: [
                                            Container(
                                              decoration: AppStyles.whiteCircleBg,
                                              padding: const EdgeInsets.all(8),
                                              child: Image.asset(
                                                "assets/images/wallet.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Wallet",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: CustomColors.textColor,
                                                  ),
                                                ),
                                                Text(
                                                  "Available Balance  : ₹$walletBalance",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: CustomColors.textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        // Checkbox
                                        Checkbox(
                                          value: bookingViewModel.userWalletBalance.value,
                                          onChanged: (value) {
                                            bookingViewModel.userWalletBalance.value = value ?? false;
                                            bookingViewModel.checkHostelRoomAvailability(bookingViewModel.bookingRequestModelObserver.value,0);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                            const SizedBox(height: 10),
                            Obx(() => bookingViewModel.checkHostelRoomAvailabilityObserver.value.maybeWhen(
                                success: (response) {
                                  final availabilityResponse = (response as HostelRoomAvailabilityResponseModel).data;
                                  return Column(
                                    children: [
                                      const SideHeadingComponent(title: "Pricing Details",viewVisible: false),
                                      const SizedBox(height: 10),
                                      Container(
                                        decoration: AppStyles.categoryBg4,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 20, // keep bottom if you want
                                            top: 20,     // remove upper padding
                                          ),
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemBuilder: (context,index){
                                                final hostelModel =  availabilityResponse?.paymentDetailLogs?[index];
                                                return Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 2),
                                                  child: Row(
                                                    children: [
                                                      Expanded(child: Text(hostelModel?.message ?? "",style: TextStyle(fontWeight: FontWeight.w400,color: CustomColors.darkGray,fontSize: 14))),
                                                      Text("₹${hostelModel?.amount}",style: TextStyle(fontWeight: FontWeight.w400,color: CustomColors.primary,fontSize: 14)),
                                                    ],
                                                  ),
                                                );
                                              },itemCount: availabilityResponse?.paymentDetailLogs?.length ?? 0),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(child: Text("Total Amount",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.textColor,fontSize: 16))),
                                          Visibility(visible: (availabilityResponse?.discount ?? 0) + (availabilityResponse?.walletDeduction ?? 0) != 0 ,child: Text("₹${(availabilityResponse?.subTotal ?? 0) + (availabilityResponse?.discount ?? 0) + (availabilityResponse?.walletDeduction ?? 0)}",style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.textColor,fontSize: 16,decoration: TextDecoration.lineThrough, // 👈 strike-through
                                              decorationThickness: 2,
                                              decorationColor: Colors.black))),
                                          const SizedBox(width: 5),
                                          Text("₹${(availabilityResponse?.subTotal ?? 0)}",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.primary,fontSize: 16)),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Obx(()=> bookingViewModel.confirmBookingObserver.value.maybeWhen(
                                          loading: (loading) => const CircularProgressIndicator(),
                                          orElse: () =>
                                          // (bookingViewModel.guestDetailsList.length < (bookingViewModel.bookingRequestModelObserver.value?.guestCount ?? 0)) ?
                                          //     PrimaryButton(buttonTxt: "Add Guest Details", buttonClick: (){
                                          //       showModalBottomSheet(
                                          //         context: context,
                                          //         isScrollControlled: true, // allows full height scroll
                                          //         shape: const RoundedRectangleBorder(
                                          //           borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                          //         ),
                                          //         builder: (context) {
                                          //           return const AddGuestBottomSheet();
                                          //         },
                                          //       );
                                          //     })
                                          //     :
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Note : ',
                                                      style: TextStyle(color: CustomColors.textColor, fontSize: 12, fontWeight: FontWeight.w500),
                                                    ),
                                                    TextSpan(
                                                      text: 'Transfer requests are allowed only after a 7-day stay at the current hostel',
                                                      style: TextStyle(color: CustomColors.darkGray, fontSize: 12, fontWeight: FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 20),
                                                child: Container(
                                                  decoration: AppStyles.categoryBg5,
                                                  child: Row(
                                                    children: [
                                                      Checkbox(value: termsAndCondition.value , onChanged: (value){
                                                        termsAndCondition.value = value ?? false;
                                                      }),
                                                      Expanded(
                                                        child: RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'I agree to the',
                                                                style: TextStyle(color: CustomColors.textColor, fontSize: 12, fontWeight: FontWeight.w500),
                                                              ),
                                                              TextSpan(
                                                                recognizer: TapGestureRecognizer()
                                                                  ..onTap = () {
                                                                    Get.to(() => TermsAndConditionsPage());
                                                                  },
                                                                text: 'Terms And Condition,',
                                                                style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                                              ),
                                                              TextSpan(
                                                                onEnter: (value){
                                                                  Get.to(() => TermsAndConditionsPage());
                                                                },
                                                                text: 'Cancellation Policy,',
                                                                style: TextStyle(color: CustomColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                                                              ),
                                                              TextSpan(
                                                                text: 'before completing my booking',
                                                                style: TextStyle(color: CustomColors.textColor, fontSize: 12, fontWeight: FontWeight.w500),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              PrimaryButton(buttonTxt: "Confirm Booking", buttonClick: (){
                                                if(termsAndCondition.value == false){
                                                    Get.snackbar("Error","Please Agree The Terms And Conditions",backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
                                                    return;
                                                }
                                                final newRequest = bookingViewModel.bookingRequestModelObserver.value?.copyWith(guestDetailsList:bookingViewModel.guestDetailsList);
                                                bookingViewModel.performConfirmBooking(newRequest);
                                              }),
                                            ],
                                          )
                                      ),
                                      ),
                                      const SizedBox(height: 50),
                                    ],
                                  );
                                },
                                orElse: () => Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: PrimaryButton(buttonTxt: "Select Room", buttonClick: (){
                                    Get.to(() => RoomsListPage(hostelId: hostelData?.id ?? ""));
                                  }),
                                )))
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
                Obx(()=> bookingViewModel.checkHostelRoomAvailabilityObserver.value.maybeWhen(loading: (loading) => Container(width:double.infinity,height:double.infinity,color: CustomColors.black.withOpacity(0.4),child: Center(child: CircularProgressIndicator(color: CustomColors.white)),),orElse: () => SizedBox())),
                Obx(()=> bookingViewModel.updateBookingStatusObserver.value.maybeWhen(loading: (loading) => Container(width:double.infinity,height:double.infinity,color: CustomColors.black.withOpacity(0.4),child: Center(child: CircularProgressIndicator(color: CustomColors.white)),),orElse: () => SizedBox())),
              ],
            )),
      ),
    );
  }
}
