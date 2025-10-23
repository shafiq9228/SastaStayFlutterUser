import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/utils/app_styles.dart';

import '../response_model/hostel_response_model.dart';
import '../utils/custom_colors.dart';

class SortByBottomSheet extends StatefulWidget {
  final Function(String type) onClick;
  const SortByBottomSheet({super.key, required this.onClick});

  @override
  State<SortByBottomSheet> createState() => _SortByBottomSheetState();
}

class _SortByBottomSheetState extends State<SortByBottomSheet> {
  final sortList  = [
    // const AmenitiesModel(id:"popular",image: "assets/images/popularity.png",name: "Most Popular"),
    // const AmenitiesModel(id:"nearby",image: "assets/images/pin_to_pin_loation.png",name: "Nearest First"),
    const AmenitiesModel(id:"rating",image: "assets/images/rating_sort.png",name: "Guest Ratings"),
    const AmenitiesModel(id:"gtPrice",image: "assets/images/price_low_to_high.png",name: "Price - Low to High"),
    const AmenitiesModel(id:"ltPrice",image: "assets/images/price_high_to_low.png",name: "Price - High to Low"),
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(color: CustomColors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom, // handle keyboard
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // makes sheet wrap content
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text("Sort By",textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.textColor),)),
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.cancel,size: 30,color: CustomColors.primary,))
                ],
              ),
              Container(width: double.infinity,height: 2,color: CustomColors.darkGray,),
              const SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    final sortModel =  sortList[index];
                    return InkWell(
                        onTap: () {
                          widget.onClick(sortModel.id ?? "");},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Container(decoration: AppStyles.lightBlueCircleBg,child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(sortModel.image ?? "",width: 20,height: 20),
                            )),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(sortModel.name ?? "",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.textColor),),
                            )
                          ],
                        ),
                      ),
                    );
                  },itemCount: sortList.length ?? 0),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
