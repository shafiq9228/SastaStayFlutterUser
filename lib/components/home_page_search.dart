import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/filter_page.dart';
import '../pages/search_page.dart';
import '../utils/custom_colors.dart';

class HomePageSearch extends StatelessWidget {
  const HomePageSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child:Row(
                    children: [
                      const SizedBox(width: 10),
                      Image.asset("assets/images/search.png",width: 20,height: 20,color: CustomColors.gray),
                      const SizedBox(width: 10),
                      Expanded(child: Text("Search by area,hostel or city",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: CustomColors.gray),)),
                      InkWell(
                          onTap: (){
                            Get.to(() => FilterPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset("assets/images/filter.png",width: 20,height: 20,color: CustomColors.textColor),
                          ))
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
