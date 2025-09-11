import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/view_models/booking_view_model.dart';
import '../response_model/bookings_response_model.dart';
import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';


class CouponCodeComponent extends StatefulWidget {
  final CouponDataModel? couponModel;
  final bool selecting;
  const CouponCodeComponent({super.key, required this.couponModel, required this.selecting});

  @override
  State<CouponCodeComponent> createState() => _CouponCodeComponentState();
}

class _CouponCodeComponentState extends State<CouponCodeComponent> {
  DateTime today = DateTime.now();


  @override
  Widget build(BuildContext context) {
    final bookingViewModel = Get.put(BookingViewModel());

    final containerStyle = widget.couponModel?.expiryDate?.isAfter(today) == true ?
        AppStyles.googleContainerStyle
        : AppStyles.outOfStockContainerStyle;

    return GestureDetector(
      onTap: (){
        if(widget.couponModel?.expiryDate?.isAfter(today) != true){
          Get.snackbar("Error","Coupon Has Expired",backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
          return;
        }
        if(widget.selecting == false) return;

        if(bookingViewModel.selectedCoupon.value == null){
          bookingViewModel.selectedCoupon.value = widget.couponModel;
        }
        else{
          bookingViewModel.selectedCoupon.value = null;
        }
        bookingViewModel.checkHostelRoomAvailability(bookingViewModel.bookingRequestModelObserver.value,false);

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child:  Container(
          width: double.infinity,
          decoration: containerStyle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.couponModel?.code ?? "",style: TextStyle(fontWeight: FontWeight.w800,color: CustomColors.textColor,fontSize: 16),) ,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text("Flat  ₹${widget.couponModel?.discount ?? 0} Discount",style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.textColor,fontSize: 14),),
                      ),
                      Text("Order above ₹${widget.couponModel?.orderValue ?? 0} and avail this offer",style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.textColor,fontSize: 14),),
                      SizedBox(height: 5),
                      Visibility(visible:widget.selecting == true,child: Text(bookingViewModel.selectedCoupon.value == widget.couponModel ? "Remove" : "Apply",style: TextStyle(fontWeight: FontWeight.w600,color: bookingViewModel.selectedCoupon.value == widget.couponModel  ? CustomColors.red :CustomColors.primary,decoration: TextDecoration.underline,fontSize: 14),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
