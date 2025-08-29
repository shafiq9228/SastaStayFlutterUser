import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pg_hostel/pages/search_page.dart';
import 'package:pg_hostel/utils/app_styles.dart';
import '../utils/custom_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TypeOfHostelComponent extends StatelessWidget {
  const TypeOfHostelComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            OptionWidget("Boys", "assets/images/boys.png", () {
              Get.to(() => SearchPage(search: "Boys", type: 'Search'));
            }),
            OptionWidget("Girls", "assets/images/girls.png", () {
              Get.to(() => SearchPage(search: "Girls", type: 'Search'));
            }),
            OptionWidget("Couple", "assets/images/couple.png", () {
              Get.to(() => SearchPage(search: "Couple", type: 'Search'));
            }),
          ],
        ),
      ),
    );
  }
}

Widget OptionWidget(String name, String image, VoidCallback onTap) {

  List<BoxDecoration> decorations = [AppStyles.categoryBg1,AppStyles.categoryBg2,AppStyles.categoryBg3,AppStyles.categoryBg4,AppStyles.categoryBg5];
  final random = Random();


  return SizedBox(
    height: 100,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 100),
          child: Container(
            decoration: decorations[random.nextInt(decorations.length)],
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
  );
}