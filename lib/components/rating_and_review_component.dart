import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pg_hostel/components/custom_network_image.dart';
import 'package:pg_hostel/response_model/auth_response_model.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/utils/custom_colors.dart';

class RatingAndReviewComponent extends StatelessWidget {
  final RatingAndReviewModel? ratingAndReviewModel;
  const RatingAndReviewComponent({super.key, this.ratingAndReviewModel});

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = ratingAndReviewModel?.userId == null ? null : UserModel.fromJson(ratingAndReviewModel?.userId ?? '');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Container(
        color: CustomColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    userModel?.profilePic?.isEmpty == true ? 'https://i.stack.imgur.com/l60Hf.png' : userModel?.profilePic ?? "https://i.stack.imgur.com/l60Hf.png",
                  ),
                  backgroundColor: Colors.grey,
                ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userModel?.name ?? "",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: CustomColors.textColor),),
                      SizedBox(height: 5),
                      IgnorePointer(
                          child: RatingBar.builder(
                            initialRating: double.tryParse((ratingAndReviewModel?.rating ?? "0").toString()) ?? 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Image.asset("assets/images/star.png"),
                            onRatingUpdate: (rating) {

                            },
                          )
                      )
                    ],
                  ),
                ))
              ],
            ),
            const SizedBox(height: 10),
            Text(ratingAndReviewModel?.review ?? "",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: CustomColors.darkGray),),
            const SizedBox(height: 10),
            DottedLine(dashColor: CustomColors.darkGray)
          ],
        ),
      ),
    );
  }
}
