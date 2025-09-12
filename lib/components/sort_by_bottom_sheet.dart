import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../response_model/hostel_response_model.dart';
import '../utils/custom_colors.dart';

class SortByBottomSheet extends StatefulWidget {
  const SortByBottomSheet({super.key});

  @override
  State<SortByBottomSheet> createState() => _SortByBottomSheetState();
}

class _SortByBottomSheetState extends State<SortByBottomSheet> {
  final sortList  = [AmenitiesModel(id:"popular",image: "",name: "Most Popular"),
    AmenitiesModel(id:"nearby",image: "",name: "Nearest First"),
    AmenitiesModel(id:"rating",image: "",name: "Guest Ratings"),
    AmenitiesModel(id:"ltPrice",image: "",name: "Price - Low to High"),
    AmenitiesModel(id:"gtPrice",image: "",name: "Price - High to Low"),
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
                  Expanded(child: Text("Sort By",textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20,color: CustomColors.textColor),)),
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.cancel,size: 30,color: CustomColors.primary,))
                ],
              ),
              Container(width: double.infinity,height: 2,color: CustomColors.darkGray,),
              SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    final hostelModel =  sortList[index];
                    return const SizedBox();
                  },itemCount: sortList.length ?? 0),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
