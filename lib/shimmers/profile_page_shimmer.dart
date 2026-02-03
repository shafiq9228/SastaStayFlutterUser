import 'package:dotted_line/dotted_line.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';
import '../utils/custom_colors.dart';

class ProfilePageShimmer extends StatelessWidget {
  const ProfilePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: CustomColors.textColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(color: CustomColors.white,borderRadius:BorderRadius.circular(20),boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // subtle shadow
                        blurRadius: 10, // how soft the shadow is
                        offset: const Offset(1, 6), // horizontal, vertical offset
                      )],),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0), // Add some padding inside the card
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: GestureDetector(
                                onTap: () {
                                  // Get.to(() => RegisterUserPage(userModel: userModel));
                                },
                                child: FadeShimmer.round(
                                  size: 80,
                                  millisecondsDelay: 300,
                                  highlightColor: Colors.grey.shade200,
                                  baseColor:Colors.white,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                FadeShimmer(
                                  height: 20,
                                  width: 100,
                                  radius: 10,
                                  millisecondsDelay: 300,
                                  highlightColor: Colors.grey.shade200,
                                  baseColor:Colors.white,
                                ),
                                const SizedBox(height: 5),
                                FadeShimmer(
                                  height: 20,
                                  width: 150,
                                  radius: 10,
                                  millisecondsDelay: 320,
                                  highlightColor: Colors.grey.shade200,
                                  baseColor:Colors.white,
                                ),
                                const SizedBox(height: 5),
                                FadeShimmer(
                                  height: 20,
                                  width: 100,
                                  radius: 10,
                                  millisecondsDelay: 350,
                                  highlightColor: Colors.grey.shade200,
                                  baseColor:Colors.white,
                                ),
                                const SizedBox(height: 20),
                                FadeShimmer(
                                  height: 30,
                                  width: 100,
                                  radius: 20,
                                  millisecondsDelay: 400,
                                  highlightColor: Colors.grey.shade200,
                                  baseColor:Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(color: CustomColors.white,borderRadius:BorderRadius.circular(20),boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // subtle shadow
                          blurRadius: 10, // how soft the shadow is
                          offset: const Offset(1, 6), // horizontal, vertical offset
                        )],),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Row(
                          children: [
                            FadeShimmer.round(
                              size: 50,
                              millisecondsDelay: 300,
                              highlightColor: Colors.grey.shade200,
                              baseColor:Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FadeShimmer(
                                    height: 20,
                                    width: 50,
                                    radius: 10,
                                    millisecondsDelay: 350,
                                    highlightColor: Colors.grey.shade200,
                                    baseColor:Colors.white,
                                  ),
                                  const SizedBox(height: 5),
                                  FadeShimmer(
                                    height: 20,
                                    width: 100,
                                    radius: 10,
                                    millisecondsDelay: 400,
                                    highlightColor: Colors.grey.shade200,
                                    baseColor:Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconShimmer(1),
              Container(width: 0.5, height: 50, color: CustomColors.darkGray),
              iconShimmer(2),
              Container(width: 0.5, height: 50, color: CustomColors.darkGray),
              iconShimmer(3),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: AppStyles.categoryBg3,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    profileMenu(1),
                    DottedLine(dashColor: CustomColors.darkGray),
                    profileMenu(2),
                    DottedLine(dashColor: CustomColors.darkGray),
                    profileMenu(3),
                    DottedLine(dashColor: CustomColors.darkGray),
                    profileMenu(4),
                    DottedLine(dashColor: CustomColors.darkGray),
                    profileMenu(5),
                    DottedLine(dashColor: CustomColors.darkGray),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }

  Widget profileMenu(int index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        children: [
          FadeShimmer.round(
        size: 30,
        millisecondsDelay: index * 300,
        highlightColor: Colors.grey.shade200,
        baseColor:Colors.white,
      ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FadeShimmer(
              height: 20,
              width: 130,
              radius: 10,
              millisecondsDelay: index*350,
              highlightColor: Colors.grey.shade200,
              baseColor:Colors.white,
            ),
          ),
          Spacer(),
          FadeShimmer(
            height: 20,
            width: 20,
            radius: 10,
            millisecondsDelay: index*400,
            highlightColor: Colors.grey.shade200,
            baseColor:Colors.white,
          ),
        ],
      ),
    );
  }

  Widget iconShimmer(int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeShimmer.round(
          size: 50,
          millisecondsDelay: index * 300,
          highlightColor: Colors.grey.shade200,
          baseColor:Colors.white,
        ),
        SizedBox(height: 5),
        FadeShimmer(
          height: 20,
          width: 20,
          radius: 10,
          millisecondsDelay: index*400,
          highlightColor: Colors.grey.shade200,
          baseColor:Colors.white,
        ),
        SizedBox(height: 2),
        FadeShimmer(
          height: 20,
          width: 50,
          radius: 10,
          millisecondsDelay: index*400,
          highlightColor: Colors.grey.shade200,
          baseColor:Colors.white,
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
