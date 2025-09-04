import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pg_hostel/pages/notifications_page.dart';
import 'package:pg_hostel/pages/search_page.dart';
import 'package:pg_hostel/response_model/auth_response_model.dart';
import 'package:pg_hostel/utils/custom_colors.dart';
import 'package:pg_hostel/view_models/auth_view_model.dart';
import 'package:get/get.dart';

class HomePageComponent extends StatelessWidget {
  const HomePageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Get.put(AuthViewModel());
    return Container(
      color: CustomColors.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:20,left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Image.asset("assets/images/location.png",width: 20,height: 20),
                  Expanded(
                    child: Obx(() =>
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(authViewModel.locationDetails.value?.address1 ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.white,fontSize: 18)),
                      ),
                    ),
                  ),
                  Image.asset("assets/images/bottom_line.png",width: 10,height: 10,color: CustomColors.white),
                  const SizedBox(width:20),
                  InkWell(
                    onTap: (){
                      Get.to(() => const NotificationsPage());
                    },
                    child: Container(
                        decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(500),color: CustomColors.white.withOpacity(0.3))
                        ,child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset("assets/images/bell.png",width: 20,height: 20,color: CustomColors.white,),
                        )),
                  )
                ],),
                const SizedBox(height: 10),
                Obx(()=> Text(authViewModel.fetchUserDetailsObserver.value.maybeWhen(success: (data) => "Hi, ${(data as FetchUserDetailsResponseModel).data?.name ?? ""} 👋",orElse: () => ""),style: TextStyle(fontWeight: FontWeight.w600,color: CustomColors.white,fontSize: 18))),
                const SizedBox(height: 5),
                Text("Lets Find The Best Hostel",style: TextStyle(fontWeight: FontWeight.w800,color: CustomColors.white,fontSize: 20)),
              ],
            ),
          ),
          Container(
            color: CustomColors.white,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 50, // Increase height to stretch into an oval
                  decoration: BoxDecoration(
                    color: CustomColors.primary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(200, 20),
                      bottomRight: Radius.elliptical(200, 20),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(() => const SearchPage(type: 'Search'));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(width: double.infinity
                      ,decoration: BoxDecoration(color: CustomColors.white,borderRadius: BorderRadius.circular(20),border: Border.all(width: 0.5,color: CustomColors.lightGray)),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                          child: Row(
                            children: [
                              Image.asset("assets/images/search.png",width: 20,height: 20,color: CustomColors.gray),
                              const SizedBox(width: 10),
                              Text("Search by area,hostel or city",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: CustomColors.gray),),
                            ],
                          ),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
