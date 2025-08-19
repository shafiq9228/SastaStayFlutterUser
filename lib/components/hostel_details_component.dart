import 'package:flutter/material.dart';
import 'package:pg_hostel/components/amenities_component.dart';
import 'package:pg_hostel/components/primary_button.dart';
import 'package:pg_hostel/pages/hostel_details_page.dart';
import 'package:pg_hostel/response_model/hostel_response_model.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';

import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';
import 'custom_network_image.dart';
import 'package:get/get.dart';


class HostelDetailsComponent extends StatelessWidget {
  final HostelModel? hostelModel;
  const HostelDetailsComponent({super.key, required this.hostelModel});


  @override
  Widget build(BuildContext context) {
    final hostelViewModel = Get.put(HostelViewModel()); 
   
    return  InkWell(
      onTap: (){
        Get.to(() => HostelDetailPage(hostelId: hostelModel?.id ?? ''));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(width: 0.5,color: CustomColors.lightGray)),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomNetworkImage(imageUrl: hostelModel?.hostelImage ?? 'https://i.pinimg.com/originals/5b/81/5f/5b815fa3c99fc946d20070770857e829.png',width: double.infinity,height: 150,fit: BoxFit.cover),
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
                                  child: Text(hostelModel?.hostelType ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.green)),
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
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              Visibility(
                visible: hostelModel?.amenities?.isNotEmpty == true,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 40,
                    child: Builder(
                      builder: (context) {
                        final List<AmenitiesModel> displayList = List.from(hostelModel?.amenities ?? []);
                        if ((hostelModel?.amenitiesMore ?? 0) > 0) {
                          displayList.add(
                            AmenitiesModel(
                              image: "https://firebasestorage.googleapis.com/v0/b/sastastay-1d420.firebasestorage.app/o/bannerImages%2F1755513864049.png?alt=media&token=b25f99c1-8dcc-44a7-a888-fc7bf4398426",
                              name: "${hostelModel?.amenitiesMore} More",
                            ),
                          );
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: displayList.length,
                          itemBuilder: (context, index) {
                            return AmenitiesComponent(amenitiesModel: displayList[index],view: 1);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: Text(hostelModel?.hostelName ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: CustomColors.black))),
                          Image.asset("assets/images/star.png",width: 18,height: 18),
                          Text("${hostelModel?.rating ?? 0}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.black)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Image.asset("assets/images/location.png",width: 10,height: 10,color: CustomColors.darkGray),
                            Expanded(child: Text(hostelModel?.location?.address1 ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray))),
                            Text("${hostelModel?.totalVotes ?? 0} reviews",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray))
                          ],
                        ),
                      ),
                      hostelModel?.room != null  ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Image.asset("assets/images/info.png",width: 10,height: 10,color: CustomColors.darkGray),
                                Expanded(child: Text("Avg. Locality Price",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray))),
                                Text("₹${hostelModel?.room?.rent?.monthly ?? ""}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.primary)),
                                Text("/mo",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray)),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("₹${hostelModel?.room?.rent?.monthly ?? ""}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.black)),
                              Text("/mo",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray)),
                              Spacer(),
                              Text("+₹600 taxes and fee",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.darkGray)),
                            ],
                          ),
                          SizedBox(height: 10),
                          PrimaryButton(buttonTxt: "Book Now",buttonClick: (){
                            Get.to(() => HostelDetailPage(hostelId: hostelModel?.id ?? ''));
                          })
                        ],
                      ) :  Text("Currently Rooms Are Unavailable",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.red))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
