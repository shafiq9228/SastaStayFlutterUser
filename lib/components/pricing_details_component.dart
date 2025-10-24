import 'package:flutter/material.dart';
import 'package:pg_hostel/components/side_heading_component.dart';
import 'package:pg_hostel/response_model/bookings_response_model.dart';

import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';

class PricingDetailsComponent extends StatefulWidget {
  final BookingModel? bookingDataModel;
  const PricingDetailsComponent({super.key, required this.bookingDataModel});

  @override
  State<PricingDetailsComponent> createState() => _PricingDetailsComponentState();
}

class _PricingDetailsComponentState extends State<PricingDetailsComponent> {
  bool priceDetailsView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SideHeadingComponent(title: "Pricing Details",viewVisible: false),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: Text("Total Amount",style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.textColor,fontSize: 16))),
            Visibility(visible: (widget.bookingDataModel?.discount ?? 0) + (widget.bookingDataModel?.walletDeduction ?? 0) != 0 ,child: Text("₹${(widget.bookingDataModel?.subTotal ?? 0) + (widget.bookingDataModel?.discount ?? 0) + (widget.bookingDataModel?.walletDeduction ?? 0)}",style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.textColor,fontSize: 16,decoration: TextDecoration.lineThrough, // 👈 strike-through
                decorationThickness: 2,
                decorationColor: Colors.black))),
            const SizedBox(width: 5),
            Text("₹${(widget.bookingDataModel?.subTotal ?? 0)}",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.primary,fontSize: 16)),
            IconButton(onPressed: (){
              setState(() {
                priceDetailsView = !priceDetailsView;
              });

            }, icon: Icon(!priceDetailsView ? Icons.keyboard_arrow_down_sharp : Icons.keyboard_arrow_up_sharp,color: CustomColors.textColor,size: 20))
          ],
        ),
        Visibility(
          visible: priceDetailsView,
          child: Container(
            decoration: AppStyles.categoryBg4,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20, // keep bottom if you want
                top: 0,     // remove upper padding
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context,index){
                        final hostelModel =  widget.bookingDataModel?.logs?[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: [
                              Expanded(child: Text(hostelModel?.message ?? "",style: TextStyle(fontWeight: FontWeight.w400,color: CustomColors.darkGray,fontSize: 14))),
                              Text("₹${hostelModel?.amount}",style: TextStyle(fontWeight: FontWeight.w400,color: CustomColors.primary,fontSize: 14)),
                            ],
                          ),
                        );
                      },itemCount: widget.bookingDataModel?.logs?.length ?? 0),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: Text("Total Amount",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.textColor,fontSize: 16))),
                      Visibility(visible: (widget.bookingDataModel?.discount ?? 0) + (widget.bookingDataModel?.walletDeduction ?? 0) != 0 ,child: Text("₹${(widget.bookingDataModel?.subTotal ?? 0) + (widget.bookingDataModel?.discount ?? 0) + (widget.bookingDataModel?.walletDeduction ?? 0)}",style: TextStyle(fontWeight: FontWeight.w500,color: CustomColors.textColor,fontSize: 16,decoration: TextDecoration.lineThrough, // 👈 strike-through
                          decorationThickness: 2,
                          decorationColor: Colors.black))),
                      const SizedBox(width: 5),
                      Text("₹${(widget.bookingDataModel?.subTotal ?? 0)}",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColors.primary,fontSize: 16)),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
