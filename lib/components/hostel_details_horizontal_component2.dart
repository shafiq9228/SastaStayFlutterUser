import 'package:flutter/material.dart';
import 'package:pg_hostel/components/custom_network_image.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';

import '../pages/hostel_details_page.dart';
import '../response_model/hostel_response_model.dart';
import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';
import 'package:get/get.dart';

import '../utils/geo_util.dart';
import '../view_models/hostel_view_model.dart';

class HostelDetailsHorizontalComponent2 extends StatelessWidget {
  final HostelModel? hostelModel;
  const HostelDetailsHorizontalComponent2({super.key,required this.hostelModel});

  @override
  Widget build(BuildContext context) {
    final hostelViewModel = Get.put(HostelViewModel());
    final authViewModel = Get.put(AuthViewModel());


    return  InkWell(
      onTap: (){
        Get.to(() => HostelDetailPage(hostelId: hostelModel?.id ?? ''));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(width: 0.5,color: CustomColors.darkGray)),
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CustomNetworkImage(imageUrl: hostelModel?.hostelImage ?? 'https://www.askiitians.com/blog/wp-content/uploads/2014/08/MG_0286.jpg',width: 250,height: 130,fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                          ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 100),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: CustomColors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:10,vertical: 5),
                              child: Text(hostelModel?.hostelType ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.green)),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Obx(() => hostelViewModel.updateFavouritesObserver.value.maybeWhen(
                            loading: (loadingId) => loadingId ==  hostelModel?.id ? const CircularProgressIndicator() : Container(width: 30,height: 30,decoration: AppStyles.whiteCircleBg,child:Center(child: Icon(hostelModel?.isFavorite == true ? Icons.favorite : Icons.favorite_outline_rounded,size: 20,color: hostelModel?.isFavorite == true ? CustomColors.red : CustomColors.black))),
                            orElse: () => InkWell(
                              onTap: (){
                                hostelViewModel.updateFavouriteStatus(hostelModel?.id ?? "",hostelModel?.isFavorite ?? false);
                              },
                              child: Container(width: 30,height: 30,decoration: AppStyles.whiteCircleBg,child:Center(child: Icon(hostelModel?.isFavorite == true ? Icons.favorite : Icons.favorite_outline_rounded,size: 20,color: hostelModel?.isFavorite == true ? CustomColors.red : CustomColors.black))),
                            )
                        )
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(hostelModel?.hostelName ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: CustomColors.black)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/location.png",width: 15,height: 15,color: CustomColors.darkGray),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:5),
                              child: Text(hostelModel?.location?.address1 ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: CustomColors.darkGray)),
                            )),
                            Text(GeoUtil().getDistanceFromLatLonInKm(hostelModel?.location?.latitude ?? 0.00,hostelModel?.location?.longitude?? 0.00,authViewModel.locationDetails.value?.latitude ?? 0.00,authViewModel.locationDetails.value?.longitude ?? 0.00),maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray)),
                          ],
                        ),
                      ),
                      hostelModel?.room != null ? Row(
                        children: [
                          Text("₹${hostelModel?.room?.rent?.monthly ?? ""}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: CustomColors.black)),
                          Text("/mo",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: CustomColors.darkGray)),
                          Spacer(),
                          Image.asset("assets/images/star.png",width: 18,height: 18),
                          SizedBox(width: 5),
                          Text("${hostelModel?.rating ?? ""}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: CustomColors.black)),
                          Text("(${hostelModel?.totalVotes ?? ""})",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: CustomColors.darkGray)),
                          SizedBox(width: 5),
                        ],
                      ): Text("Currently Rooms Are Unavailable",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: CustomColors.red)),
                      SizedBox(height: 5)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
