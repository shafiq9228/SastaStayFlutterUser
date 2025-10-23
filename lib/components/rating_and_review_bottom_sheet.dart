import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pg_hostel/api/api_result.dart';
import 'package:pg_hostel/components/helper_bottom_sheet.dart';
import 'package:pg_hostel/components/primary_button.dart';
import 'package:pg_hostel/request_model/bookings_request_model.dart';
import 'package:pg_hostel/utils/statefullwrapper.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';

import '../pages/filter_page.dart';
import '../utils/custom_colors.dart';
import 'custom_edit_text_component.dart';

class RatingAndReviewBottomSheet extends StatefulWidget {
  final String hostelId;
  const RatingAndReviewBottomSheet({super.key, required this.hostelId});

  @override
  State<RatingAndReviewBottomSheet> createState() => _RatingAndReviewBottomSheetState();
}

class _RatingAndReviewBottomSheetState extends State<RatingAndReviewBottomSheet> {
  final TextEditingController reviewController = TextEditingController();
  final hostelViewModel = Get.put(HostelViewModel());
  RxDouble ratingValue = 1.0.obs;
  RxString ratedFor = "Other".obs;

  List<String> ratingTypes = [
    "Value for Money",
    "Cleanliness",
    "Safety & Security",
    "Food Quality",
    "Location",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),color: CustomColors.white),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom, // handle keyboard
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // makes sheet wrap content
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(child: Text("Rating And Review",textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.textColor),)),
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.cancel,size: 30,color: CustomColors.primary,))
                  ],
                ),
                const SizedBox(height: 10),
                DottedLine(dashColor: CustomColors.lightGray),
                const SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Image.asset("assets/images/star.png"),
                  onRatingUpdate: (rating) {
                    ratingValue.value = rating;
                  },
                ),
                const SizedBox(height: 10),
                CustomEditTextComponent(controller: reviewController, title: "Enter You Name", hint: "Rating And Review",containerHeight:100),
                const SizedBox(height: 10),
                Wrap(
                    spacing: 8,
                    children: ratingTypes.map((item) {
                      return InkWell(
                          onTap: (){
                            ratedFor.value = item;
                            // Get.to(() => SearchPage(type: "Search",search: item));
                          }, child: Obx(() => CustomChip(label: item,isSelected:ratedFor.value ==  item))
                      );
                    }).toList()
                ),
                const SizedBox(height: 10),
                Obx(() => hostelViewModel.addRatingAndReviewObserver.value.maybeWhen(
                  loading: (loading) => const Center(child: CircularProgressIndicator()),
                    orElse: () => PrimaryButton(buttonTxt: "Submit", buttonClick: (){
                      hostelViewModel.addRatingAndReview(RatingReviewRequestModel(hostelId: widget.hostelId,rating:ratingValue.value,ratedFor:ratedFor.value,review: reviewController.text),context);
                    }))),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
