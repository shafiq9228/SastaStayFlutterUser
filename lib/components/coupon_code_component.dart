import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../response_model/bookings_response_model.dart';
import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';


class CouponCodeComponent extends StatefulWidget {
  final CouponDataModel? couponModel;
  const CouponCodeComponent({super.key, required this.couponModel});

  @override
  State<CouponCodeComponent> createState() => _CouponCodeComponentState();
}

class _CouponCodeComponentState extends State<CouponCodeComponent> {
  DateTime today = DateTime.now();


  @override
  Widget build(BuildContext context) {

    final containerStyle = widget.couponModel?.expiryDate?.isAfter(today) == true ?
        AppStyles.googleContainerStyle
        : AppStyles.outOfStockContainerStyle;

    return GestureDetector(
      onTap: (){
        if(widget.couponModel?.expiryDate?.isAfter(today) != true){
          Get.snackbar("Error","Coupon Has Expired",backgroundColor: CustomColors.primary,colorText: CustomColors.white,snackPosition: SnackPosition.BOTTOM);
        }
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
