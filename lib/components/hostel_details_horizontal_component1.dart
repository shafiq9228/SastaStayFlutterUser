import 'package:flutter/material.dart';
import 'package:pg_hostel/components/custom_network_image.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/utils/auth_utils.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';

import '../pages/hostel_details_page.dart';
import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';
import 'package:get/get.dart';

import '../utils/geo_util.dart';
import '../view_models/hostel_view_model.dart';
import 'animated_tap.dart';

class HostelDetailsHorizontalComponent1 extends StatelessWidget {
  final HostelModel? hostelModel;
  final bool? infinityWidth;
  const HostelDetailsHorizontalComponent1({super.key, required this.hostelModel, this.infinityWidth});

  @override
  Widget build(BuildContext context) {
    final hostelViewModel = Get.put(HostelViewModel());
    final authViewModel = Get.put(AuthViewModel());


    return  AnimatedTap(
      onTap: (){
        Get.to(() => HostelDetailPage(hostelId: hostelModel?.id ?? ''));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(color: CustomColors.white,borderRadius: BorderRadius.circular(15)),
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CustomNetworkImage(imageUrl: hostelModel?.hostelImage ?? 'https://images.squarespace-cdn.com/content/v1/5e72c8bfe21ad940ba788673/1620923464746-9P9CHDE3GWWYHK2WWALV/hostel-dorm-bedroom-two.jpg',width: 180,height: 120,fit: BoxFit.cover,borderRadius: 15),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child:  Obx(() => hostelViewModel.updateFavouritesObserver.value.maybeWhen(
                        loading: (loadingId) => loadingId ==  hostelModel?.id ? const CircularProgressIndicator() : Container(width: 25,height: 25,decoration: AppStyles.whiteCircleBg,child:Center(child: Icon(hostelModel?.isFavorite == true ? Icons.favorite : Icons.favorite_outline_rounded,size: 15,color: hostelModel?.isFavorite == true ? CustomColors.red : CustomColors.black))),
                        orElse: () => AnimatedTap(
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
                  padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(hostelModel?.hostelName ?? "",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.black)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/location.png",width: 15,height: 15,color: CustomColors.darkGray),
                            const SizedBox(width: 2),
                            // Expanded(child: Text(hostelModel?.location?.address1 ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray))),
                            // const SizedBox(width: 2),
                            Expanded(child: Text("${GeoUtil().getDistanceFromLatLonInKm(hostelModel?.location?.latitude ?? 0.00,hostelModel?.location?.longitude?? 0.00,authViewModel.locationDetails.value?.latitude ?? 0.00,authViewModel.locationDetails.value?.longitude ?? 0.00)},${hostelModel?.location?.address1 ?? ""}",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: CustomColors.darkGray))),
                          ],
                        ),
                      ),
                      hostelModel?.room != null ? Row(
                        children: [
                          Text("₹${hostelModel?.room?.rent?.monthly ?? ""}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: CustomColors.black)),
                          Text("/Mo",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: CustomColors.darkGray)),
                          Spacer(),
                          Image.asset("assets/images/star.png",width: 12,height: 12),
                          const SizedBox(width: 5),
                          Text("${hostelModel?.rating ?? ""}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: CustomColors.black)),
                          Text("(${AuthUtils.formatNumber(hostelModel?.totalVotes ?? 0)})",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: CustomColors.darkGray)),
                          SizedBox(width: 5),
                        ],
                      ) : Text("Currently Rooms Are Unavailable",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: CustomColors.red))
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
