import 'package:flutter/material.dart';
import 'package:pg_hostel/components/custom_network_image.dart';

import '../pages/hostel_details_page.dart';
import '../response_model/hostel_response_model.dart';
import '../utils/custom_colors.dart';
import 'package:get/get.dart';

class HostelDetailsHorizontalComponent2 extends StatelessWidget {
  final HostelModel? hostelModel;
  const HostelDetailsHorizontalComponent2({super.key,required this.hostelModel});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Get.to(() => HostelDetailPage(hostelId: hostelModel?.id ?? ''));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(width: 0.5,color: CustomColors.lightGray)),
          width: 240,
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
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(200),color: CustomColors.white),
                          child: Center(child: Icon(Icons.favorite,color: CustomColors.red,size: 18)),
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
                      const SizedBox(height: 10),
                      Text(hostelModel?.hostelName ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: CustomColors.black)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Image.asset("assets/images/location.png",width: 15,height: 15,color: CustomColors.darkGray),
                            Expanded(child: Text(hostelModel?.location?.address1 ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: CustomColors.darkGray))),
                          ],
                        ),
                      ),
                      hostelModel?.room != null ? Row(
                        children: [
                          Text("₹${hostelModel?.room?.rent?.monthly ?? ""}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.black)),
                          Text("/mo",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.darkGray)),
                          Spacer(),
                          Image.asset("assets/images/star.png",width: 18,height: 18),
                          Text("${hostelModel?.rating ?? ""}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: CustomColors.black)),
                          Text("(${hostelModel?.totalVotes ?? ""})",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: CustomColors.darkGray)),
                        ],
                      ): Text("Currently Beds Are Unavailable",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: CustomColors.red))
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
