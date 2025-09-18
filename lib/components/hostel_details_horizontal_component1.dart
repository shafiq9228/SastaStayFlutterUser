import 'package:flutter/material.dart';
import 'package:pg_hostel/components/custom_network_image.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';

import '../pages/hostel_details_page.dart';
import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';
import 'package:get/get.dart';

import '../utils/geo_util.dart';
import '../view_models/hostel_view_model.dart';

class HostelDetailsHorizontalComponent1 extends StatelessWidget {
  final HostelModel? hostelModel;
  const HostelDetailsHorizontalComponent1({super.key, required this.hostelModel});

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
          decoration: BoxDecoration(color: CustomColors.white,borderRadius: BorderRadius.circular(8)),
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CustomNetworkImage(imageUrl: hostelModel?.hostelImage ?? 'https://images.squarespace-cdn.com/content/v1/5e72c8bfe21ad940ba788673/1620923464746-9P9CHDE3GWWYHK2WWALV/hostel-dorm-bedroom-two.jpg',width: 200,height: 100,fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child:  Obx(() => hostelViewModel.updateFavouritesObserver.value.maybeWhen(
                        loading: (loadingId) => loadingId ==  hostelModel?.id ? const CircularProgressIndicator() : Container(width: 25,height: 25,decoration: AppStyles.whiteCircleBg,child:Center(child: Icon(hostelModel?.isFavorite == true ? Icons.favorite : Icons.favorite_outline_rounded,size: 15,color: hostelModel?.isFavorite == true ? CustomColors.red : CustomColors.black))),
                        orElse: () => InkWell(
                          onTap: (){
                            hostelViewModel.updateFavouriteStatus(hostelModel?.id ?? "",hostelModel?.isFavorite ?? false);
                          },
                          child: Container(width: 25,height: 25,decoration: AppStyles.whiteCircleBg,child:Center(child: Icon(hostelModel?.isFavorite == true ? Icons.favorite : Icons.favorite_outline_rounded,size: 15,color: hostelModel?.isFavorite == true ? CustomColors.red : CustomColors.black))),
                        )
                    )
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 5),
                      Text(hostelModel?.hostelName ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: CustomColors.black)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/location.png",width: 15,height: 15,color: CustomColors.darkGray),
                            const SizedBox(width: 2),
                            Expanded(child: Text(hostelModel?.location?.address1 ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray))),
                            const SizedBox(width: 2),
                            Text(GeoUtil().getDistanceFromLatLonInKm(hostelModel?.location?.latitude ?? 0.00,hostelModel?.location?.longitude?? 0.00,authViewModel.locationDetails.value?.latitude ?? 0.00,authViewModel.locationDetails.value?.longitude ?? 0.00),maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray)),
                          ],
                        ),
                      ),
                      hostelModel?.room != null ? Row(
                        children: [
                          Text("₹${hostelModel?.room?.rent?.monthly ?? ""}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.black)),
                          Text("/Mo",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: CustomColors.darkGray)),
                          Spacer(),
                          Image.asset("assets/images/star.png",width: 15,height: 15),
                          SizedBox(width: 5),
                          Text("${hostelModel?.rating ?? ""}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.black)),
                          Text("(${hostelModel?.totalVotes ?? ""})",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: CustomColors.darkGray)),
                          SizedBox(width: 5),
                        ],
                      ) : Text("Currently Rooms Are Unavailable",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: CustomColors.red))
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
