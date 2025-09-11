import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pg_hostel/pages/search_page.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import 'package:pg_hostel/view_models/hostel_view_model.dart';
import '../utils/custom_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TypeOfHostelComponent extends StatelessWidget {
  final bool? filter;
  const TypeOfHostelComponent({super.key, this.filter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            OptionWidget("Popular","assets/images/hostel.png"),
            OptionWidget("Boys", "assets/images/boys.png"),
            OptionWidget("Girls", "assets/images/girls.png"),
            OptionWidget("Co-living", "assets/images/couple.png"),
            OptionWidget("Luxury", "assets/images/luxury.png"),
          ],
        ),
      ),
    );
  }

  Widget OptionWidget(String name, String image) {
    final hostelViewModel = Get.put(HostelViewModel());

    RxList<BoxDecoration> decorations = [AppStyles.categoryBg1,AppStyles.categoryBg2,AppStyles.categoryBg3,AppStyles.categoryBg4,AppStyles.categoryBg5].obs;
    final random = Random();

    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: (){
          if(filter == true){
            if(hostelViewModel.filterHostelTypes.contains(name.toLowerCase())){
              hostelViewModel.filterHostelTypes.remove(name.toLowerCase());
            }
            else{
              hostelViewModel.filterHostelTypes.add(name.toLowerCase());
            }
          }
          else if(name == "Popular"){
            Get.to(() => const SearchPage(type: "Popular"));
          }
          else{
            Get.to(() => SearchPage(search: name, type: 'Search'));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 100),
            child: Obx(() =>
                Container(
                decoration: filter == true ? (hostelViewModel.filterHostelTypes.contains(name.toLowerCase()) ? AppStyles.selectedCategoryBg : AppStyles.categoryBg6 ): decorations[random.nextInt(decorations.length)],
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(image, width: 40, height: 40),
                      const SizedBox(height: 5), // Add some spacing
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: CustomColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

